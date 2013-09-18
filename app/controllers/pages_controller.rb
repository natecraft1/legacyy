class PagesController < ApplicationController
	def home
		@users = User.all
		@usernames = @users.collect { |item| item.name }
	end
end
