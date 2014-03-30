require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "signup page" do
		before { visit signup_path }
		it { should have_content('Welcome') }
	end

	describe "signin page" do
		before { visit signin_path }
		it { should have_content('Welcome back') }
	end

	describe "profile page" do
		before { @user = User.new(id: 1, name: "Foo Bar", email: "foo@bar.com", password: "foobar", password_confirmation: "foobar")}
		before { visit user_path(@user) }

		it { should have_content(@user.name) }
	end

end