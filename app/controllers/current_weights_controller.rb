class CurrentWeightsController < ApplicationController

	# Create new current weight entry
	def create
		# Build new current weight for user
		@current_weight = current_user.current_weights.build(weight_params)
		if @current_weight.save # If saved
			flash[:success] = "Weight updated"
			redirect_to weight_user_path(current_user)
		end
	end

	private

	def weight_params
		params.require(:current_weight).permit(:weight)
	end

end
