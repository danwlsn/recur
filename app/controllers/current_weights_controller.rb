class CurrentWeightsController < ApplicationController

	def create
		@current_weight = current_user.current_weights.build(weight_params)
		if @current_weight.save
			redirect_to current_user
		end
	end

	private

	def weight_params
		params.require(:current_weight).permit(:weight)
	end

end
