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
  	status == "requested"
  end

  def self.accept(acceptor, acceptee)
  	acceptor_relationship = Relationship.find_by_follower_id_and_followed_id(acceptor.id, acceptee.id)
  	acceptee_relationship = Relationship.find_by_follower_id_and_followed_id(acceptee.id, acceptor.id)
    puts "acceptor_relationship == #{acceptor_relationship.inspect}"
    puts "acceptee_relationship == #{acceptee_relationship.inspect}"

  	if acceptor_relationship.nil? || acceptee_relationship.nil? 
      puts "if "* 30
  		return false
  	else
      puts "else " * 30
  		transaction do
  			acceptor_relationship.update_attributes(status: "accepted")
  			acceptee_relationship.update_attributes(status: "accepted")
  		end
  	end
  	return true
  end

  def self.reject(rejector, rejectee)
    rejector_relationship = Relationship.find_by_follower_id_and_followed_id(rejector, rejectee)
    rejectee_relationship = Relationship.find_by_follower_id_and_followed_id(rejectee, rejector)
    if rejector_relationship.nil? || rejectee_relationship.nil? 
      return false
    else
      transaction do
        rejector_relationship.destroy
        rejectee_relationship.destroy
        return true
      end
    end
  end

	def self.request(requester, requestee)
		return false if are_friends?(requester, requestee)
    return false if requester == requestee
		requester_relationship = new(follower_id: requester.id, followed_id: requestee.id, status: "pending")
		requestee_relationship = new(follower_id: requestee.id, followed_id: requester.id, status: "requested")
		transaction do 
			requester_relationship.save
			requestee_relationship.save
		end
	end
end
