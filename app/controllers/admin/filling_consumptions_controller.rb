class Admin::FillingConsumptionsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def set_params
	end

	def start
		@counter = 0
	end

	private

  def filling_consumers_params
    params.require(:filling_consumers).permit(:datafile)
  end

end
