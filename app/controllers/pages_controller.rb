class PagesController < ApplicationController
	def home
		@users = User.all
		puts "@users ==== #{@users.class}"
		@usernames = @users.collect { |item| item.name }
	end
end
