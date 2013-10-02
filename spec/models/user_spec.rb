require 'spec_helper'

describe User do
  let(:user)  { FactoryGirl.create(:user) }
  before { @user = user }
  

	subject { @user }
	it { should respond_to(:name) }
	it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:relationships) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }



	describe "when name is not present" do
    before { @user.name = "" ; @user.save }
      it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end
  describe "when password is not present" do
 		before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: " ", password_confirmation: " ")
  	end
  	it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
  	before { @user.password_confirmation = "mismatch" }
  	it { should_not be_valid }
	end

	describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  # why are the following tests failing??
	describe "return value of authenticate method" do
    before { @user.save }
    let!(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
	describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

  describe "methods" do 
    let(:user) { FactoryGirl.create(:user) }

    describe "yearborn" do
      it "should return 1967" do
        expect(user.yearborn).to eq(1967)
      end
    end
    describe "ageray" do 
      it "should return the reverse array of 0 to age" do
        user.stub(:age).and_return(3)
        expect(user.ageray).to eq([3,2,1,0])
      end
    end
  end

  describe "relationships" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
    @followed = FactoryGirl.create(:user, :name => "Nathan Ass", :email => FactoryGirl.generate(:email))
    end

    it "should have a relationship method" do
      expect(user).to respond_to(:relationships)
    end
    it "should have a following method" do
      expect(user).to respond_to(:followed_users)
    end
    it "should follow another user" do
      user.follow!(@followed)
      expect(user).to be_following(@followed)
    end
    it "should include the followed user in the user.following array" do
      user.follow!(@followed)
      user.followed_users.should include(@followed)
    end

  end
end










