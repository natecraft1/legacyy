class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create

		@user = User.new(user_params)

		if @user.save
			sign_in @user
		  render name_path(@user.name, @user.age)
		else
			render 'new'
		end
	end
	
	def name
    gon.currentyr = params[:age]
    # gon.image_style = "300x300>"
		@user = User.find_by_name(params[:name])
		puts "@user.name ===> #{@user.name}"

    gon.ageray = @user.ageray.reverse!

    @years_true = !@user.years.find_by_year(params[:age]).nil?

		if @user.years.find_by_year(params[:age])
			@currentyr = @user.years.find_by_year(params[:age])
		else 
			@currentyr = :edit_year
		end
  	# @currentyr = @user.years.find_by_year(params[:age].to_i)


		gon.age = @user.ageray[0]
		gon.username = @user.name
		@year = Year.new(:user => @user)
		gon.posts = @user.years


		# @post = @user.years.all
		render 'show'
	end

	def show
    gon.currentyr = val
    puts "params[:key] ==== #{params[:key]}"
		@user = User.find(params[:id])

  	# @user = User.find_by_name(params[:name].capitalize)
  	gon.age = @user.ageray[0]
		gon.username = @user.name
		@year = Year.new(:user => @user)
		gon.posts = @user.years

	  # @ageray.each do |year|
   #  	i =  @ageray.index(year)
   #  	range =  i < 6 ? (@ageray[0]-10..@ageray[0]).to_a.reverse : (year-5..year+5).to_a.reverse
  	# end

	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :date_of_birth)
	end
end


