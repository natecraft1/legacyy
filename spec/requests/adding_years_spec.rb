require 'spec_helper'
describe "user page features" do

	let(:user) { FactoryGirl.create(:user) }
	before { visit user_path(user) }
	puts :user

	describe "at least one field must be filled in" do
		let(:submit) { "Create Year" }
		before do
			fill_in "What i did", with: ""
			fill_in "Lesson or story", with: ""
			click_button "Create Year"
		end

		it "should stay on the same page" do
			expect(current_path).to eq user_path(user)
		end

		it "should be invalid" do
			expect { click_button submit }
  		expect(page).to have_content("At least one field must be present")
		end

 	end
 	describe "click a specific year" do

 		before { click_link "33" }
 		
 		it "should change the path to the number that was clicked on" do
 			expect(current_path).to eq('/nathanglass/33')
 		end
 		
 		it "should change the displayed year to 33" do
 			expect(page).to have_content("at 33")
 		end

 	end
end

# why does rspec blow up when i change users#show to find_by_name?