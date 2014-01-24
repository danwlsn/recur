class FitnessLogsController < ApplicationController

	def create
		@fitness_log = current_user.fitness_logs.build(fitness_params)
		if @fitness_log.save
			flash[:success] = "Log Updates"
			redirect_to current_user
		end
	end

	private

	def fitness_params
		params.require(:fitness_log).permit(:activity, :type, :time, :reps, :sets, :weight)
	end

end
