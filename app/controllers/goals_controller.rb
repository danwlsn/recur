class GoalsController < ApplicationController

	def create
		@goal = current_user.goals.build(goal_params)
		if @goal.save # If save
			respond_to do |format|
				format.html {
					flash[:success] = "Goal added"
					redirect_to goals_user_path(current_user)
				}
				format.js {
					flash.now[:success] = "Goal added"
				}
			end
		else
			flash[:error] = "Failed to add goal"
			redirect_to goals_user_path(current_user)
		end
	end

	def update
	end

	def complete
		@goal = Goal.find(params[:id])
		@goal.update_attributes(:complete => true)
		redirect_to root_path
	end

	private

	def goal_params
		params.require(:goal).permit(:goal)
	end

end
