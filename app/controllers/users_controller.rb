class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create

		@user = User.new(user_params)

		if @user.save
			sign_in @user
		  redirect_to name_path(@user.name, @user.age)
		else
			render 'new'
		end
	end
	
	def name
		@user = User.find_by_name(params[:name])
		puts "user relationships === #{@user.relationships.each {|z| z.inspect}}"
		@relationships = @user.relationships.includes(:followed)
		puts "relationships === #{@relationships.map {}}"
		@requested_relationships = @relationships.select &:requested?
		puts "@requested_relationships = #{@requested_relationships}"
		if !params[:age].nil? 
			gon.currentyr = params[:age] 
		else 
			redirect_to name_path(@user.name, @user.age)
		end
    
    gon.shortArray = @user.shortArray(params[:age])

    gon.ageray = @user.ageray

    gon.yearborn = @user.yearborn
    
    @years_true = !@user.years.find_by_year(params[:age]).nil?

    @currentyr = User.find_user_year(params[:name], params[:age])

   	puts "@currentyr === #{@currentyr}"
		gon.username = @user.name
		@year = Year.new(:user => @user)
		gon.posts = @user.years

	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :date_of_birth)
	end
end


