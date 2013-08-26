class UsersController < ApplicationController
	
	def new
		@user = User.new
		puts "users#new called with #{@user}"
	end

	def create
		@user = User.new(user_params)
		puts "users#create action called with #{@user}"
		if @user.save
			puts "after save, sign in is called"
			sign_in @user
			redirect_to(@user)
			flash.now[:notice] = "welcome!"
		else
			render 'new'
		end

	end

	def show
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end

