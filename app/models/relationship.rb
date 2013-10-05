class Relationship < ActiveRecord::Base

	# attr_accessible :followed_id
	belongs_to :follower, :foreign_key => "follower_id", class_name: "User"
	belongs_to :followed, :foreign_key => "followed_id", class_name: "User"

	validates :follower_id, presence: true 
	validates :followed_id, presence: true 

	def self.request(requester, requestee)
		requester_relationship = new(follower_id: requester, followed_id: requestee, status: "pending")
		requestee_relationship = new(follower_id: requestee, followed_id: requester, status: "requested")
		transaction do 
			requester_relationship.save
			requestee_relationship.save
		end
	end
end
