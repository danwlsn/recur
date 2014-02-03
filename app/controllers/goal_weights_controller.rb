class GoalWeightsController < ApplicationController

	# Create new goal weight entry
	def create
		# Build entry for current users
		@goal_weight = current_user.goal_weights.build(weight_params)
		if @goal_weight.save # If save
			flash[:success] = "Weight updated"
			respond_to do |format|
				format.html { redirect_to current_user }
				format.js
			end
		end
	end

	private

	def weight_params
		params.require(:goal_weight).permit(:weight)
	end
end
