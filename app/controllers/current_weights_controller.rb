class CurrentWeightsController < ApplicationController

	def create
		@current_weight = current_user.current_weights.build(weight_params)
		if @current_weight.save
			flash[:success] = "Weight updated"
			redirect_to weight_user_path(current_user)
		end
	end

	private

	def weight_params
		params.require(:current_weight).permit(:weight)
	end

end
