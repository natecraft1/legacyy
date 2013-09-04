class YearsController < ApplicationController
  respond_to :json, only: [:show]
	def new
		@year = Year.new
    puts "************************************ #{@user}"
	end

  def show
    render :json
  end
  def create
    user = User.find(params[:user_id])
    year = Year.new(year_params)
    # year.id = params[:year][:year]
    user.years << year

    if user.save
      flash[:notice] = "success"
    else
      flash[:notice] = user.years.last.errors.full_messages[0]
    end

    redirect_to user_path(user)

  end

	private
    def year_params
      params.require(:year).permit(:what_i_did, :lesson_or_story, :avatar, :year)
    end
end
