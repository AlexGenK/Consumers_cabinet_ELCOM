class ConsumptionsController < ApplicationController
  before_action :set_consumer

  def index
    @consumption = @consumer.consumptions.first
    if @consumption
      redirect_to consumer_consumption_path(@consumer, @consumption)
    end
  end

  private

  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end

end
