require 'spec_helper'

describe "Static pages" do

	describe "about page" do
		it "should have the content 'About'" do
			visit '/about'
			expect(page).to have_content('About')
		end
	end

	describe "contact page" do
		it "should have the content 'Contact'" do
			visit '/contact'
			expect(page).to have_content('About')
		end
	end
end