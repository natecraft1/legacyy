require 'spec_helper'

describe Relationship do
	
	let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user, :name => "Nathan Ass", :email => FactoryGirl.generate(:email)) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { should be_valid }

  describe "follower methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    its(:follower) { should eq follower }
    its(:followed) { should eq followed }
  end

	it "should create a new instance with valid attributes" do
		@follower.relationships.create!(@attr)
	end

	describe "follow methods" do
		
		before(:each) do
			@relationship = @follower.relationships.create!(@attr)
		end

		it "should have a follower attribute" do 
			@relationship.should respond_to(:follower)
		end
		it "should have the right follower" do
			@relationship.follower.should == @follower
		end
		it "should have a followed attribute" do 
			@relationship.should respond_to(:followed)
		end
		it "should have the right follower" do
			@relationship.followed.should == @followed
		end
	end
	describe "validations" do
		describe "when followed id is not present" do
    	before { relationship.followed_id = nil }
    	it { should_not be_valid }
  	end

  	describe "when follower id is not present" do
    	before { relationship.follower_id = nil }
    	it { should_not be_valid }
  	end
		it "should require a follower id" do
			Relationship.new(@attr).should_not be_valid
		end
		it "should require a followed id" do 
			@follower.relationships.build.should_not be_valid
		end 
	end
end