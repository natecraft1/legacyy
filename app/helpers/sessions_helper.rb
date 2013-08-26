module SessionsHelper
	def sign_in(user)
		puts "puts sign in called"
		remember_token = User.new_remember_token
		puts remember_token
		cookies.permanent[:remember_token] = remember_token
		puts cookies
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		puts "puts user = #{user}" 
		self.current_user = user
		#puts "puts self = #{self}"
		#puts " puts #{self.current_user} = self.current_user"
	end

	def signed_in?
		puts self
		puts "puts check if signed in"
    !current_user.nil?
    #puts "returns false"
  end

	def current_user=(user)
    @current_user = user
  end

  def current_user
  	puts "puts current_user method called"
    remember_token = User.encrypt(cookies[:remember_token])
    # why is there a remember token if there is not a current user?
    puts remember_token
    puts "puts @current_user = #{@current_user}"
   #  puts "puts user found by remmeber token" + if User.find_by(remember_token: remember_token) then "something" else "nothing" end
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_out
  	puts "puts sign out called"
    self.current_user = nil
    cookies.delete(:remember_token)
    puts cookies
  end
end
