require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "signup" do
		before { visit signup_path }

		let(:submit) { "Sign me up" }
		let(:delete) { "Delete" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Full name",               with: "Example User"
				fill_in "Email",                   with: "user@example.com"
				fill_in "Secret password",         with: "foobar"
				fill_in "Confirm secret password", with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end

		describe "when passwords don't match" do
			before do
				fill_in "Full name",               with: "Example User"
				fill_in "Email",                   with: "user@example.com"
				fill_in "Secret password",         with: "foobar"
				fill_in "Confirm secret password", with: "barfoo"
			end
		end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before { sign_in user }
		before { visit edit_user_path(user) }

		describe "page" do
			it { should have_content("Edit your profile") }
		end

		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should have_content('Inccorect email or password') }
		end

		describe "with valid information" do
			before do
				fill_in "Full name",        with: "New Name"
				fill_in "Password",         with: "foobar"
				fill_in "Confirm password", with: "foobar"
				click_button "Save changes"
			end

			it { should have_content('New Name')}
		end

		describe "change weight format" do
			before do
				choose('option_weight_kgs')
				click_button "Update Preferences"
			end

			it {should have_content("Weight format updated") }
		end
	end

	describe "user dashboard" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			sign_in user
			visit user_path(user)
		end

		it { should have_content user.name }

		describe "links" do
			it { should have_link ('Weight'), href: weight_user_path(user)}
			it { should have_link ('Goal'), href: goals_user_path(user) }
			it { should have_link ('Fitness Log'), href: log_user_path(user) }
		end

		describe "weight page" do
			before { visit weight_user_path(user) }

			it { should have_content('Weight') }

			describe "update current weight" do
				describe "with invalid information" do
					before do
						fill_in "current_weight_weight", with: "foo"
						click_button "Update Current"
					end

					it { should have_content('Failed to add weight') }
				end

				describe "with valid information" do
					before do
						fill_in "current_weight_weight", with: 99
						click_button "Update Current"
					end

					it {should have_content('Weight updated') }
					it { should have_content(99) }
				end
			end

			describe "update goal weight" do
				describe "with invalid information" do
					before do
						fill_in "goal_weight_weight", with: "foo"
						click_button "Update Goal"
					end

					it { should have_content('Failed to add weight') }
				end

				describe "with valid information" do
					before do
						fill_in "goal_weight_weight", with: 99
						click_button "Update Goal"
					end

					it {should have_content('Weight updated') }
					it { should have_content(99) }
				end
			end
		end

		describe "goals page" do
			before do
				user.goals.build(:goal => "New goal").save
				visit goals_user_path(user)
			end

			it { should have_content('Goals') }
			it {should have_content("New goal") }

			describe "add goal" do
				describe "with valid information" do
					before do
						fill_in "goal_goal", with: "Write some tests"
						click_button "Submit"
					end

					it { should have_content('Write some tests') }
				end

				describe "with invalid information" do
					before do
						fill_in "goal_goal", with: " "
						click_button "Submit"
					end

					it { should have_content('Failed to add goal') }
				end

				describe "check off goal" do
					before { find(:css, "#goals[value='1']").set(true) }

					it "should have removed goal" do
						expect do
							change(user.goals, :count).by(-1)
							should_not have_content('New goal')
						end
					end
				end
			end
		end
	end
end