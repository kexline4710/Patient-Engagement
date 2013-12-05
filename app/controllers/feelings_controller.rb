class FeelingsController < ApplicationController


	private

	def feeling_params
		params.require(:feeling).permit!
	end

end