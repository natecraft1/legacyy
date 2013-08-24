require 'spec_helper'
puts "Hello"
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
end



