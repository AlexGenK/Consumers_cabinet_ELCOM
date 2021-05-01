class ConsumptionsController < ApplicationController
  before_action :set_consumer

  def index
    @consumptions = @consumer.consumptions.all.order(period: :desc)
  end

  private

  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end

end
