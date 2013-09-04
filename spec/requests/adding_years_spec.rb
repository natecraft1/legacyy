require 'spec_helper'
describe "user page features" do

	let(:user) { FactoryGirl.create(:user) }
	before { visit user_path(user) }
	puts :user

	describe "creating a year post" do
		let(:submit) { "Create Year" }

		describe "post attempt that doesn't satisfy validations" do
			before do
				fill_in "What i did", with: ""
				fill_in "Lesson or story", with: ""
				click_button "Create Year"
			end

			it "should stay on the same page" do
				expect(current_path).to eq user_path(user)
			end

			it "should be invalid" do
				expect { click_button submit }.not_to change(Year, :count)
	  		expect(page).to have_content("At least one field must be present")
			end
	 	end

	 	describe "year post that satisfies validations" do
	 		before { @year = FactoryGirl.create(:year, :user => user) }
	 		it "should post the content to the current page" do
	 			expect(page).to have_content(@year.what_i_did)
	 		end
	 		describe "the form disappears after a year post is submitted" do
				it "hides the form after a post is submitted" do
					expect(page).not_to have_content("What i did")
					expect(page).not_to have_button("Create Year")
				end
			end
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