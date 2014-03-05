module SessionsHelper
	# Sign user in
	def sign_in(user)
		# Create remember token
		remember_token = User.new_remember_token
		# Add save token as cookie
		cookies.permanent[:remember_token] = remember_token
		# Update user with remember token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end

	# Create current_user
	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	# Check if current user is user
	def current_user?(user)
		user == current_user
	end

	# Is user admin
	def userAdmin?(user)
		return user[:access] == 1
	end

	# Check if signed in
	def signed_in?
		!current_user.nil?
	end

	# Sign out function
	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
end
