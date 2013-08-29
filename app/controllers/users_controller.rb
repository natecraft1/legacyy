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
		# I was passing a new year to the show page to be editted 

		# yearnow = Time.now.strftime("%Y/%m/%d").gsub('/', '').scan(/..../)[0].to_i
		# yearborn = @user.date_of_birth.to_s.gsub('-', '').scan(/..../)[0].to_i
		# datenow = Time.now.strftime("%Y/%m/%d").gsub('/', '').scan(/..../)[1].to_i
		# dateborn = @user.date_of_birth.to_s.gsub('-', '').scan(/..../)[1].to_i

	 #  @age = datenow > dateborn ? yearnow - yearborn : yearnow - yearborn - 1

	 #  @ageray = (0..@age).to_a.reverse

	 #  @ageray.each do |year|
  #   	i =  @ageray.index(year)
  #   	range =  i < 6 ? (@ageray[0]-10..@ageray[0]).to_a.reverse : (year-5..year+5).to_a.reverse
  # 	end

	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :date_of_birth)
	end
end


