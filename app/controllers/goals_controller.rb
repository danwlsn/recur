class GoalsController < ApplicationController

	def create
		@goal = current_user.goals.create(goal_params)
		if @goal.save # If save
			flash[:success] = "Goal created"
			redirect_to current_user
		end
	end

	def update
	end

	private

	def goal_params
		params.require(:goal).permit(:goal)
	end

end
