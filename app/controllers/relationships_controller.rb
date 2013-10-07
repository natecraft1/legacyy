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
	
	def accept
		puts "self = #{self}"
		puts "params = #{params}"
		@current = current_user
		@requester = User.find(params[:id])
		unless @requester.nil?
			if Relationship.accept(@current, @requester)
				flash[:notice] = "You are now friends with #{@requester.name}"
			else
				flash[:error] = "Cannot accept friendship with #{@requester.name}"
			end
		end
		redirect_to :back
	end

	def reject
		@current = current_user
		@requester = User.find(params[:id])
		unless @requester.nil?
			if Relationship.reject(@current, @requester)
				flash[:notice] = "You rejected #{@requester.name}"
			else
				flash[:error] = "Cannot reject friendship with #{@requester.name}"
			end
		end
		redirect_to :back
	end
end
