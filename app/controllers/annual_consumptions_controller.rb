class AnnualConsumptionsController < ApplicationController
  include Verifiable

  before_action :set_consumer
  before_action :detect_invalid_user
  authorize_resource :class => false

  def show
  	e_scope = @consumer.consumptions
    d_scope = @consumer.distributions
    @years = GetUniqueYearsQuery.call(e_scope)
    @current_year = params['year'] || @years.first
    if @current_year
    	@annual_e_consumption = GetAnnualConsumptionsQuery.call(e_scope, @current_year)
      @annual_e_cost = GetAnnualCostQuery.call(e_scope, @current_year)
      @annual_d_cost = GetAnnualCostQuery.call(d_scope, @current_year)
    end
    Rails.logger.control.debug("Consumer Annual #{@consumer.name} : Index : #{current_user.name}")
  end

  private

  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end
end
