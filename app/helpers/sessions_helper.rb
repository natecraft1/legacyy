module SessionsHelper
	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
		
	end

	def signed_in?
    !current_user.nil?
  end

	def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    # why is there a remember token if there is not a current user?
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end



 
  # def about_me

  #   User.ageray.each do |year|
  #     i =  @ageray.index(year)
  #     range =  i < 6 ? (@ageray[0]-10..@ageray[0]).to_a.reverse : (year-5..year+5).to_a.reverse
  #   end
  # end

end
