class GoalWeightsController < ApplicationController

	# Create new goal weight entry
	def create
		# Build entry for current users
		@goal_weight = current_user.goal_weights.build(weight_params)
		if @goal_weight.save # If save
			flash[:success] = "Weight updated"
			redirect_to weight_user_path(current_user)
		end
	end

	private

	def weight_params
		params.require(:goal_weight).permit(:weight)
	end
end
