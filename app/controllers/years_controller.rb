class YearsController < ApplicationController
	def new
		@year = Year.new
    puts "************************************ #{@user}"
	end

  def create
    puts "#{self} create"
    user = User.find(params[:user_id])
    year = Year.new(year_params)
    puts "#{params[:year][:year]} = YEAR"
    year.id = params[:year][:year]
    user.years << year
    user.save

    redirect_to user_path(user)
  end

	private
    def year_params
      params.require(:year).permit(:what_i_did, :lesson_or_story, :avatar, :year)
    end
	end
