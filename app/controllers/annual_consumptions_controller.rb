class AnnualConsumptionsController < ApplicationController
  before_action :set_consumer

  def show
  	scope = @consumer.consumptions
    @years = GetUniqueYearsQuery.call(scope)
    @current_year = params['year'] || @years.first
    if @current_year
    	@annual_table = GetAnnualConsumptionsQuery.call(scope, @current_year)
    end
  end

  private

  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end
end
