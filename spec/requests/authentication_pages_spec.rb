require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }
    
    it { should have_title('Sign in') }

    describe "with invalid information" do
      before { click_button "Save Session" }

      
      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_link('Profile') }
      end
#      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_link "login"
      end

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('logout',    href: signout_path) }
      it { should_not have_link('login', href: signin_path) }
    end
  end
end