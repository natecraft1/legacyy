class YearsController < ApplicationController
 
	def new
		@year = Year.new
    puts "************************************ #{@user}"
	end

  def show
    @year = User.find_by_name(params[:user_id]).years.find_by_year(params[:id])
    @year_subset = { what_i_did: @year.what_i_did, lesson_or_story: @year.lesson_or_story, year: @year.year, avatar_url: @year.avatar.url }
    respond_to do |format|
      format.html {render :nothing => true }
      format.json { render :json => @year_subset }
    end
  end

  def create
    user = User.find_by_name(params[:name])
    puts "params === #{params}"
    year = Year.new(year_params)
    # year.id = params[:year][:year]
    user.years << year

    unless user.save
      flash[:notice] = user.years.last.errors.full_messages[0]
    end

    redirect_to name_path(user.name, params[:year][:year])

  end
  def update
    # gon.age_on_reload = params[]
        puts "params update ===> #{params}"
    user = User.find_by_name(params[:name])

    @currentyr = user.years.find_by_year(params[:year][:year])
    @currentyr.update_attributes(year_params)
    redirect_to name_path(user.name, params[:year][:year])
    
  end
  def edit
    # @user = User.find_by_name(params[:name])
    @params = params
    puts "params = #{params}"
    # @year = @user.years.find_by_year(params[:age])
  end

	private
    def year_params
      params.require(:year).permit(:what_i_did, :lesson_or_story, :avatar, :year)
    end
end
