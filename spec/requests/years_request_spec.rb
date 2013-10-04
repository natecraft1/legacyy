require 'spec_helper'
describe "user page describes" do
	
	it "should have content at most recent age" do
		user = FactoryGirl.create(:user)
		visit name_path(user.name)
		expect(page).to have_content("at 46")
	end
	
	describe "creating a year post" do
	 	describe "post attempt that doesn't satisfy validations" do
			it "should stay on the same page" do
				user = FactoryGirl.create(:user)
				sign_in(user)
				visit name_path(user.name)		
				fill_in "What i did", with: ""
				fill_in "Lesson or story", with: ""
				click_button "Create Year"
				expect(current_path).to eq name_path(user.name, user.age)
			end

			it "should be invalid" do
				
				user = FactoryGirl.create(:user)
				sign_in(user)
				visit name_path(user.name)		
				fill_in "What i did", with: ""
				fill_in "Lesson or story", with: ""
				click_button "Create Year"
				expect { click_button "Create Year" }.not_to change(Year, :count)
	  		expect(page).to have_content("At least one field must be present")
			end
		end

	 	describe "year post that satisfies validations" do
	 		it "should post the content to the current page" do
	 			user = FactoryGirl.create(:user)
	 			sign_in(user)
		 		@year = FactoryGirl.create(:year, :user => user)
	 			visit name_path(user.name)
	 			click_link "12"
	 			fill_in "What i did", with: @year.what_i_did
				fill_in "Lesson or story", with: @year.lesson_or_story
				click_button "Create Year"
				expect(page).to have_content("nathan")
				expect(page).to have_content(@year.what_i_did)
	 		end
	 		# it "should have a link to create the next year" do
	 		# 	user = FactoryGirl.create(:user)
		 	# 	@year = FactoryGirl.create(:year, :user => user)
	 		# 	visit name_path(user.name)
	 		# 	click_link "12"
	 		# 	fill_in "What i did", with: @year.what_i_did
				# fill_in "Lesson or story", with: @year.lesson_or_story
				# click_button "Create Year"
	 		# 	expect(page).to have_link("Add year 45")
	 		# end
	 		describe "the form disappears after a year post is submitted" do
				it "hides the form after a post is submitted" do
					user = FactoryGirl.create(:user)
					sign_in(user)
			 		@year = FactoryGirl.create(:year, :user => user)
		 			visit name_path(user.name)
		 			click_link "13"
		 			fill_in "What i did", with: @year.what_i_did
					fill_in "Lesson or story", with: @year.lesson_or_story
					click_button "Create Year"
					expect(page).not_to have_content("What i did")
					expect(page).not_to have_button("Create Year")
				end
			end
			describe "editing a post" do
				it "redisplays the form" do
					user = FactoryGirl.create(:user)
					sign_in(user)
			 		@year = FactoryGirl.create(:year, :user => user)
			 		visit name_path(user.name, user.age)
			 	  fill_in "What i did", with: @year.what_i_did
					fill_in "Lesson or story", with: @year.lesson_or_story
					click_button "Create Year"
					click_link "Edit this year"
					expect(page).to have_content("What i did")
				end
			  it "should have content became a developer" do
			  	user = FactoryGirl.create(:user)
					sign_in(user)
			 		@year = FactoryGirl.create(:year, :user => user)
			 		visit name_path(user.name, user.age)
			 	  fill_in "What i did", with: @year.what_i_did
					fill_in "Lesson or story", with: @year.lesson_or_story
					click_button "Create Year"
					click_link "Edit this year"
					expect(find_field("What i did").value).to eq("Became a developer")
			  end 
			  it "should change the content on the page to the next year" do
			  	user = FactoryGirl.create(:user)
					sign_in(user)
			 		@year = FactoryGirl.create(:year, :user => user)
			 		visit name_path(user.name, user.age)
			 	  fill_in "What i did", with: @year.what_i_did
					fill_in "Lesson or story", with: @year.lesson_or_story
					click_button "Create Year"
					click_link "Edit this year"
					fill_in "What i did", with: "next year"
					click_button "Update Year"
					expect(page).to have_content("next year")
			  end
			end
	 	end

 	end
 	
 	describe "back and forth arrow" do
 		it "should link backward and forward through the years" do
			user = FactoryGirl.create(:user)
			name_url = name_path(user.name.parameterize)
			visit name_path(user.name)
			click_link "<"
			expect(current_path).to eq("/nathan/32")
 		end
 	end

 	describe "click a specific year" do
				
 		it "should change the path to the number that was clicked on" do
 			user = FactoryGirl.create(:user)
			name_url = name_path(user.name.parameterize)
			visit name_path(user.name)
	 		click_link "33"
 			expect(current_path).to eq("/nathan/33")
 		end
 		
 		it "should change the displayed year to 32 " do
 			user = FactoryGirl.create(:user)
			visit name_path(user.name)
	 		click_link "32"
 			expect(page).to have_content("32")
 		end
 	end
 	describe "follower/following counts" do
		let(:user) { FactoryGirl.create(:user) }
    let(:other_user) { FactoryGirl.create(:user) }
    before do
      other_user.follow!(user)
      visit root_path
    end

    it { should have_link("0 following", href: following_user_path(user)) }
    it { should have_link("1 followers", href: followers_user_path(user)) }
  end
end

# why does rspec blow up when i change users#show to find_by_name?