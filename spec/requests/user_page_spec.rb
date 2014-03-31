require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "signup" do
		before { visit signup_path }

		let(:submit) { "Sign me up" }

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

			it "should create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end
	end
end