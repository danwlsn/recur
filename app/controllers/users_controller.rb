class UsersController < ApplicationController
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
			@current_weight = @user.current_weights.last
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
		@current_weight = current_user.current_weights.build
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end