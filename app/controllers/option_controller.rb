class OptionController < ApplicationController

	def update
		current_user.option.update_attributes(option_params)
		redirect_to root_path
	end

	private
	def option_params
		params.require(:option).permit(:weight)
	end

end
