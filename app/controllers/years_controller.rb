class YearsController < ApplicationController
 
	def new
		@year = Year.new
	end

  def show
      @year = User.find_user_year(params[:user_id], params[:id])
      @year_subset = { what_i_did: @year.what_i_did, lesson_or_story: @year.lesson_or_story, year: @year.year, avatar_url: @year.avatar.url }
    respond_to do |format|
      format.html { render :nothing => true }
      format.json { render :json => @year_subset }
    end
  end

  def create
    user = User.find_by_name(params[:name])
    year = Year.new(year_params)
    user.years << year
    unless user.save
      flash[:notice] = user.years.last.errors.full_messages[0]
    end

    redirect_to name_path(user.name, params[:year][:year])

  end
  def update
    puts "params update === #{params}"
    year = params[:year][:year]
    user = User.find_by_name(params[:name])
    @currentyr = user.years.find_by_year(year)
    @currentyr.update_attributes(year_params)
    
    redirect_to name_path(user.name, year)
    
  end

	private
    def year_params
      params.require(:year).permit(:what_i_did, :lesson_or_story, :avatar, :year)
    end
end
