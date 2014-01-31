class UsersController < ApplicationController
	# Authenticate user on edit/update/show
	before_action :signed_in_user, only: [:edit, :update]
	before_action :correct_user,   only: [:edit, :update, :show]

	# Users index
	def index
		# If users is signed in
		if current_user.present?
			redirect_to user_path(current_user) # bounce them to their page
		end
	end

	# Create new user - view
	def new
		@user = User.new
	end

	# Create new users
	def create
	@user = User.new(user_params)
	# If save
	if @user.save
		sign_in(@user) # sign user in
		redirect_to @user # bounce them to their page
	else
		render 'new' # Else bounce them to sign up
	end
end

	# Show users
	def show
		@user = User.find(params[:id]) # Find user
		@today = Date.current(); # Today's date
		# If current weight exsits
		if @user.current_weights.exists?(:user_id => @user.id)
			@current_weight = @user.current_weights.last[:weight]
		else
			@current_weight = 0
		end
		# If goal weight exsists
		if @user.goal_weights.exists?(:user_id => @user.id)
			@goal_weight = @user.goal_weights.last[:weight]
		else
			@goal_weight = 0
		end
		# If fitness log exists
		if @user.fitness_logs.exists?(:user_id => @user.id)
			# Get last entry
			@lastGymVisit = @user.fitness_logs.last[:created_at]
			# Get log - group by date
			@fitnessLog = FitnessLog.find(:all, :order => "created_at DESC").group_by { |log| log.created_at.strftime("%d/%m") }
		end
	end

	# Edit user
	def edit
		# Find user
		@user = User.find(params[:id])
	end

	# Edit user - view
	def update
		# Find user
		@user = User.find(params[:id])
		# If update success
		if @user.update_attributes(user_params)
			flash.now[:success] = "Informtion updated" # Flash messages
			redirect_to @user # Redirect to their pages
		else
			flash.now[:error] = "Inccorect email or password" # Flash error
			render 'edit' # Show edit page again
		end
	end

	# Weight view
	def weight
		# Find users
		@user = User.find(params[:id])
		# If current weight exists
		if @user.current_weights.exists?(:user_id => @user.id)
			@cw = @user.current_weights.last[:weight]
		else
			@cw = 0
		end
		# If goal weight exsits
		if @user.goal_weights.exists?(:user_id => @user.id)
			@gw = @user.goal_weights.last[:weight]
		else
			@gw = 0
		end
		# Build varibles for forms
		@current_weight = current_user.current_weights.build
		@goal_weight = current_user.goal_weights.build
	end

	# Log view
	def log
		# Log variable for form
		@fitness_log = current_user.fitness_logs.build
	end

	private

		# Params from forms
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		# Bounce user to sign in if not signed in
		def signed_in_user
			redirect_to signin_url, notice: "Please sign in." unless signed_in?
		end

		# Bounce user to root if not correct user
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end
end