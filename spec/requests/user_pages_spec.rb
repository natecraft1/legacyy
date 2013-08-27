require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title('Sign up') }
  end
	describe "profile page" do
   	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }

  	it { should have_content(user.name) }
  	it { should have_title(user.name) }
	end
	describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create User" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password", with: 'foobar', :match => :prefer_exact
        fill_in "Password confirmation", with: 'foobar', :match => :prefer_exact
      end

      it "should create a user" do
        expect { click_button submit; should have_content("user@example.com"); save_and_open_page
 }.to change(User, :count).by(1) 
      end
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }


        it { should have_link('logout') }
        it { should have_content(user.name) }
        # it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
      describe "followed by signout" do
        before { click_link "logout" }
        it { should have_link('login') }
      end
    end
  end
end