class AnnualConsumptionsController < ApplicationController
  before_action :set_consumer

  def show
    @years = GetUniqueYearsQuery.call(@consumer.consumptions)
    @current_year = params['year'] || @years.first
  end

  private

  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end
end
