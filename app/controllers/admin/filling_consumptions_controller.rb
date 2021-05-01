class Admin::FillingConsumptionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def set_params
  end

  def start
    @imported_records = ReadCsvFileService.call(params[:datafile], [:onec_id, :period, :opening_balance, :money,
                                                                    :power, :cost, :closing_balance])
    @records_to_consumptions = ModifyHashService.to_consumptions(@imported_records)
    @counter = MassCreateConsumptionsQuery.call(@records_to_consumptions)
  end

  private

  def filling_consumers_params
    params.require(:filling_consumers).permit(:datafile)
  end

end
