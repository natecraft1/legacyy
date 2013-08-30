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
		@user = User.find(params[:id])
		@year = Year.new(:user => @user)

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


