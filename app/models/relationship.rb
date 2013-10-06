class Relationship < ActiveRecord::Base

	# attr_accessible :followed_id
	belongs_to :follower, :foreign_key => "follower_id", class_name: "User"
	belongs_to :followed, :foreign_key => "followed_id", class_name: "User"

	validates :follower_id, presence: true 
	validates :followed_id, presence: true 

	def self.are_friends?(user, friend)

    return false if user == friend
    return true unless find_by_follower_id_and_followed_id(user, friend).nil?
    return true unless find_by_follower_id_and_followed_id(friend, user).nil?
    false
  end
	
  def requested? 
  	puts "#{self.inspect} called called valled"
  	status == "requested"
  end

	def self.request(requester, requestee)
		return false if are_friends(user, friend)
    return false if user == friend
		requester_relationship = new(follower_id: requester.id, followed_id: requestee.id, status: "pending")
		requestee_relationship = new(follower_id: requestee.id, followed_id: requester.id, status: "requested")
		transaction do 
			requester_relationship.save
			requestee_relationship.save
		end
	end
end
