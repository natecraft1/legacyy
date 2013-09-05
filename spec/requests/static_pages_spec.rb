require 'spec_helper'
describe "home page content"  do
	before { visit home_path }
	
	it "should display content 'WordsBond'" do
		expect(page).to have_content("WordsBond")
	end
	it "should have a signup button" do
		expect(page).to have_link("get started")
	end
	it "should have a login link" do
		expect(page).to have_link("login")
	end
	describe "index page" do

		it "should have a list of all the users" do 
			user = FactoryGirl.create(:user)
			visit home_path
			expect(page).to have_link(user.name + ", " + user.age.to_s)
		end
		it "should match the intro sentence to the current params" do
			user = FactoryGirl.create(:user)
			visit '/nathan/3'
			expect(page).to have_content("3")
		end
	end
end



