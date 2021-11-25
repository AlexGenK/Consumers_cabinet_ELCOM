class AnnualConsumptionsController < ApplicationController
  include Verifiable

  before_action :set_consumer
  before_action :detect_invalid_user
  authorize_resource :class => false

  def show
  	scope = @consumer.consumptions
    @years = GetUniqueYearsQuery.call(scope)
    @current_year = params['year'] || @years.first
    if @current_year
    	@annual_table = GetAnnualConsumptionsQuery.call(scope, @current_year)
    end
    Rails.logger.control.debug("Consumer Annual #{@consumer.name} : Index : #{current_user.name}")
  end

  private

  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end
end
