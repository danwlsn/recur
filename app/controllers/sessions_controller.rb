class SessionsController < ApplicationController
	def new
	end

	# Create new session
	def create
		# Find user by email entered
	  user = User.find_by(email: params[:session][:email].downcase)
	  # If password and email match
	  if user && user.authenticate(params[:session][:password])
	    sign_in user # sign user in
      redirect_to user # redirect to user
	  else
	  	flash[:error] = "Email and password combination incorrect"
	    render 'new' # else bounce them back to sign in
	  end
	end

	# Destroy session
	def destroy
		sign_out # sign user out
		redirect_to root_url # bounce them back to root
	end
end
