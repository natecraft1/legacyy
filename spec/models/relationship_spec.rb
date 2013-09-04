require 'spec_helper'

describe Relationship do
	before do
		@follower = FactoryGirl.create(:user, :name => "Scotty the Cutie")
		@followed = FactoryGirl.create(:user, :email => FactoryGirl.generate(:email))
		@attr = { :followed_id => @followed.id }
	end
	it "should create a new instance with valid attrs" do
		@follower.relationships.create!(@attr)
		puts @follower.relationships.inspect
	end

	describe "follow methods" do
		before do
			@relationship = @follower.relationships.create!(@attr)
		end
		it "should have a follower attribute" do
			expect(@relationship).to respond_to(:follower)
		end
		it "should have the right follower" do
			expect(@relationship.follower).to eq(@follower)
		end
		it "should have a followed attribute" do
			expect(@relationship).to respond_to(:followed)
		end
		it "should have the right followed" do
			expect(@relationship.followed).to eq(@followed)
		end
	end
end