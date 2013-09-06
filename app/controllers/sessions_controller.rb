class SessionsController < ApplicationController

def new 
end

def create
	puts "session create params === #{params}"
	user = User.find_by_email(params[:session][:email].downcase)
	if user && user.authenticate(params[:session][:password])
		sign_in user
		redirect_to name_path(user.name)
	else
		flash[:error] = "invalid email or password"
		render 'new'
	#error, rerender sign in page
	end
	
end

def destroy
	sign_out
	redirect_to root_url
end

end
