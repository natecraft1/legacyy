class RelationshipsController < ApplicationController
	def req
		# is setting @current_user since the current_user method already returns @current_user?
		@friend = User.find_by_name(params[:name])
		
		unless @friend.nil?
			if Relationship.request(current_user, @friend)
			  flash[:notice] = "Friendship with #{@friend.name} requested"
			else
				flash[:error] = "Friendship with #{@friend.name} cannot be requested"
			end
		end
	end
end
