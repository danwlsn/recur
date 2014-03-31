require 'spec_helper'

describe "Authentication" do

	subject { page }

	describe "signin page" do
		before { visit signin_path }

		it { should have_content('Welcome back') }

		describe "with invalid information" do
			before { click_button "Sign in" }

			it { should have_selector('div.error') }
		end

		describe "with invalid password" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email address",    with: user.email.upcase
				fill_in "Password",         with: "wrongpassword"
				click_button "Sign in"
			end

			it { should have_selector('div.error') }
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email address",    with: user.email.upcase
				fill_in "Password",         with: user.password
				click_button "Sign in"
			end

			it { should have_link(user.name,     href: user_path(user)) }
			it { should have_link('Sign out',    href: signout_path) }
			it { should have_link('Edit',        href: edit_user_path(user)) }
			it { should_not have_link('Sign in', href: signin_path) }
		end
	end
end
