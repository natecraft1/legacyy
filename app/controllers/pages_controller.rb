class PagesController < ApplicationController
	def home
		@users = User.all
		@first_user = User.first
		if @first_user != nil
			@image_array = switch_it_up(@first_user)
		end
		# sort = @first_user.years.sort_by { |year| 
		# 	year.year.to_i
		# }
		# @image_array = []
		# sort.map {|x|  
		# 	unless x.avatar_file_name.nil? 
		# 		@image_array << x
		# 	end 
		# }
		# @what_i_did = @image_array.map { |x| x.what_i_did.gsub("")}
		@usernames = @users.collect { |item| item.name }
	end
	def switch_it_up(user)
		sort = user.years.sort_by { |year| 
			year.year.to_i
		}
		arr = []
		sort.map {|x|  
			unless x.avatar_file_name.nil? 
				arr << x
			end 
		}
		arr.reverse
	end
end
