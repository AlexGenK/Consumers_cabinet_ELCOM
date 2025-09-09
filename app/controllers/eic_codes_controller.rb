class EicCodesController < ApplicationController
  include Verifiable
  
  before_action :set_consumer
  before_action :set_eic_code, only: [:destroy]
  before_action :detect_invalid_user
  load_and_authorize_resource

  def create
    @eic_code = @consumer.eic_codes.new(eic_code_params)
    @eic_code.save
    redirect_to consumer_payments_path(@consumer)
  end

  def destroy
    flash[:alert] = 'Неможливо видалити EIC' unless @eic_code.destroy
    redirect_to consumer_payments_path(@consumer)
  end

  private

  def eic_code_params
    params.require(:eic_code).permit(:code)
  end

  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end

  def set_eic_code
    @eic_code = EicCode.find(params[:id])
  end
end