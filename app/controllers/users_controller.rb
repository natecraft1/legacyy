class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create

		@user = User.new(user_params)


		if @user.save
			sign_in @user
			redirect_to(@user)

		else
			render 'new'
		end

	end

	def show
		# puts User.all.to_json
		@user = User.find(params[:id])
		@year = Year.new(:user => @user)
		yearnow = Time.now.strftime("%Y/%m/%d").gsub('/', '').scan(/..../)[0].to_i
		yearborn = @user.date_of_birth.to_s.gsub('-', '').scan(/..../)[0].to_i
		datenow = Time.now.strftime("%Y/%m/%d").gsub('/', '').scan(/..../)[1].to_i
		dateborn = @user.date_of_birth.to_s.gsub('-', '').scan(/..../)[1].to_i
		
		puts "$$$$$$$$$$$$$@@@@@@@@@@@ #{yearnow.class}"
		puts "$$$$$$$$$$$$$@@@@@@@@@@@ #{yearborn.class}"
		puts "$$$$$$$$$$$$$@@@@@@@@@@@ #{datenow.class}"
		puts "$$$$$$$$$$$$$@@@@@@@@@@@ #{dateborn.class}"


	  @age = datenow > dateborn ? yearnow - yearborn : yearnow - yearborn - 1
	  @ageray = (0..@age).to_a.reverse
	  puts "$$$$$$$ AGERAY = #{@ageray}"

	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :date_of_birth)
	end
end


