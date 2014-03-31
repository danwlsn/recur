class GoalWeightsController < ApplicationController

	# Create new goal weight entry
	def create
		# Build entry for current users
		@goal_weight = current_user.goal_weights.build(weight_params)
		if @goal_weight.save # If save
			respond_to do |format|
				format.html {
					flash[:success] = "Weight updated"
					redirect_to current_user
				}
				format.js {
					flash.now[:success] = "Weight updated"
				}
			end
		else
			respond_to do |format|
				format.html {
					flash[:error] = "Failed to add weight"
					redirect_to current_user
				}
				format.js {
					flash.now[:error] = "Failed to add weight"
				}
			end
		end
	end

	private

	def weight_params
		params.require(:goal_weight).permit(:weight)
	end
end
