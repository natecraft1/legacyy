class PagesController < ApplicationController
	def home
		@users = User.all
		@first_user = User.first
		sort = @first_user.years.sort_by { |year| 
			year.year.to_i
		}
		@image_array = []
		sort.map {|x|  
			unless x.avatar_file_name.nil? 
				@image_array << x
			end 
		}
		puts "image array = #{@image_array[0].avatar.url}"
		@usernames = @users.collect { |item| item.name }
	end
end
