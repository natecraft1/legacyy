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
		# @what_i_did = @image_array.map { |x| x.what_i_did.gsub("")}
		puts "image array length = #{@image_array.length}"
		puts "image array = #{@image_array}"
		@usernames = @users.collect { |item| item.name }
	end
end
