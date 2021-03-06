class ConsumptionsController < ApplicationController
  include Verifiable
  
  before_action :set_consumer
  before_action :detect_invalid_user
  load_and_authorize_resource

  def index
    @consumptions = @consumer.consumptions.all.order(period: :desc)
    @consumption = @consumptions.first
    redirect_to consumer_consumption_path(@consumer, @consumption) if @consumption
    Rails.logger.control.debug("Consumer Consumption #{@consumer.name} : Index : #{current_user.name}")
  end

  def show
     @consumptions = @consumer.consumptions.all.order(period: :desc)
     @consumption = Consumption.find(params[:id])
     Rails.logger.control.debug("Consumer Consumption #{@consumer.name} : Show : #{current_user.name}")
  end

  def selector
    @consumption = Consumption.find(params[:consumption_id])
    redirect_to consumer_consumption_path(@consumer, @consumption)
  end

  private

  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end

end
