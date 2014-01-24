class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update, :show]

	def index
		if current_user.present?
			redirect_to user_path(current_user)
		end
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		if @user.current_weights.exists?(:user_id => @user.id)
			@current_weight = @user.current_weights.last[:weight]
		else
			@current_weight = 0
		end
		if @user.goal_weights.exists?(:user_id => @user.id)
			@goal_weight = @user.goal_weights.last[:weight]
		else
			@goal_weight = 0
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in(@user)
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash.now[:success] = "Informtion updated"
			redirect_to @user
		else
			flash.now[:error] = "Inccorect email or password"
			render 'edit'
		end
	end

	def weight
		@user = User.find(params[:id])
		if @user.current_weights.exists?(:user_id => @user.id)
			@cw = @user.current_weights.last[:weight]
		else
			@cw = 0
		end
		if @user.goal_weights.exists?(:user_id => @user.id)
			@gw = @user.goal_weights.last[:weight]
		else
			@gw = 0
		end
		@current_weight = current_user.current_weights.build
		@goal_weight = current_user.goal_weights.build
	end

	def log
		@fitness_log = current_user.fitness_logs.build
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end