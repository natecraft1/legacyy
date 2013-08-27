class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create

		@user = User.new(user_params)
		yearnow = Time.now.strftime("%Y/%m/%d").gsub!('/', '').scan(/..../)[0].to_i
		yearborn = @user.date_of_birth.to_s.gsub!('-', '').scan(/..../)[0].to_i
		datenow = Time.now.strftime("%Y/%m/%d").gsub!('/', '').scan(/..../)[1].to_i
		dateborn = @user.date_of_birth.to_s.gsub!('-', '').scan(/..../)[1].to_i
	  age = datenow > dateborn ? yearnow - yearborn : yearnow - yearborn - 1  
	  puts "$$$$$$$ AGE = #{age}"

		if @user.save
			sign_in @user
			redirect_to(@user)

		else
			render 'new'
		end

	end

	def show
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :date_of_birth)
	end
end


