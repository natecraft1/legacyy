require 'spec_helper'

describe Relationship do
	
	let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user, :name => "Nathan Ass", :email => FactoryGirl.generate(:email)) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { should be_valid }


	describe "follow methods" do
		
		it "should have a follower attribute" do 
			puts relationship.inspect
			relationship.should respond_to(:follower)
		end
		it "should have the right follower" do
			relationship.follower.should == follower
		end
		it "should have a followed attribute" do 
			relationship.should respond_to(:followed)
		end
		it "should have the right follower" do
			relationship.followed.should == followed
		end
	end
	
	describe "friend requesting" do
		before(:each) do
			Relationship.request(follower, followed)
		end
		
		it "should respond_to follower_id" do
			expect(follower.relationships).to respond_to(:follower)
		end 
		
		it "should create a relationship" do
			expect(follower.relationships.follower_id).to eq(follower.id)
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
	end
end