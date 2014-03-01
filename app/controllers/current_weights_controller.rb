class CurrentWeightsController < ApplicationController

	# Create new current weight entry
	def create
		# Build new current weight for user
		@current_weight = current_user.current_weights.build(weight_params)
		if @current_weight.save # If saved
			respond_to do |format|
				flash[:success] = "Weight updated"
				format.html { redirect_to current_user }
				format.js
			end
		end
	end

	private

	def weight_params
		params.require(:current_weight).permit(:weight)
	end

end
