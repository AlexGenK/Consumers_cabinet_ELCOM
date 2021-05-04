class AnnualConsumptionsController < ApplicationController
  before_action :set_consumer

  def show
  end

  private

  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end
end
