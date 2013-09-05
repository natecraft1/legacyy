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
	
	def name
		puts params[:age].to_i + 1
    gon.currentyr = params[:age]
		@user = User.find_by_name(params[:name])
		gon.age = @user.ageray[0]
		gon.username = @user.name.gsub(" ", "").downcase
		@year = Year.new(:user => @user)
		gon.posts = @user.years

		# @post = @user.years.all
		puts "@user.inspect in name === #{@user.years.inspect}"
		render 'show'
	end

	def show
		@user = User.find(params[:id])
  	# @user = User.find_by_name(params[:name].capitalize)
  	gon.age = @user.ageray[0]
		gon.username = @user.name.gsub(" ", "").downcase
		@year = Year.new(:user => @user)

		gon.posts = @user.years
		puts "@user.years = #{@user.years.inspect}"

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


