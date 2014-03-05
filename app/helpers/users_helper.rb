module UsersHelper
	# Sign user in
	def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

	def userAdmin(user)
		return user.access == 1
	end
end
