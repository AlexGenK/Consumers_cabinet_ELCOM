class Admin::FillingConsumersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def set_params
	end

	def start
		@imported_records = ReadCsvFileService.call(params[:datafile], [:onec_id, :name, :full_name, :address,
													:edrpou, :inn, :director, :phone, :bank, :mfo, :account, :dog_en_number, :dog_en_date])
		@records_to_consumers = ModifyHashService.to_consumers(@imported_records)
		@imported_consumers = MassCreateConsumersQuery.call(@records_to_consumers)
	end

	private

  def filling_consumers_params
    params.require(:filling_consumers).permit(:datafile)
  end
end
