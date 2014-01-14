class UsersController < ApplicationController
	def index
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		@current_weight = @user.current_weights.last[:weight]
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
			redirect_to @user
		else
			render 'edit'
		end
	end

	def weight
		@user = User.find(params[:id])
		@current_weight = @user.current_weights.last[:weight]
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
