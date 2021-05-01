class Admin::FillingDistributionsController < ApplicationController
	skip_before_action :verify_authenticity_token

  def set_params
  end

  def start
    @imported_records = ReadCsvFileService.call(params[:datafile], [:onec_id, :period, :opening_balance, :money,
                                                                    :power, :cost, :closing_balance])
    @records_to_distributions = ModifyHashService.to_distributions(@imported_records)
    @counter = MassCreateDistributionsQuery.call(@records_to_distributions)
  end
end
