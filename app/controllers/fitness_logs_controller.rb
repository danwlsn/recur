class FitnessLogsController < ApplicationController

	# Create new fitness log entry
	def create
		# Builds enttry for current user
		@fitness_log = current_user.fitness_logs.build(fitness_params)
		if @fitness_log.save # if save
			flash[:success] = "Log Updated"
		else
			flash[:error] = "Failed to add log"
		end
		redirect_to log_user_path(current_user)
	end

	def destroy
		@log = FitnessLog.find(params[:id]);
		@log.destroy
		redirect_to root_url
	end

	private

	def fitness_params
		params.require(:fitness_log).permit(:activity, :type, :time, :reps, :sets, :weight)
	end

end
