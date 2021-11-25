class DistributionsController < ApplicationController
  include Verifiable
  
  before_action :set_consumer
  before_action :detect_invalid_user
  load_and_authorize_resource

  def index
    @distributions = @consumer.distributions.all.order(period: :desc)
    @distribution = @distributions.first
    Rails.logger.control.debug("Consumer Distribution #{@consumer.name} : Index : #{current_user.name}")
    redirect_to consumer_distribution_path(@consumer, @distribution) if @distribution
  end

  def show
     @distributions = @consumer.distributions.all.order(period: :desc)
     @distribution = Distribution.find(params[:id])
     Rails.logger.control.debug("Consumer Distribution #{@consumer.name} : Show : #{current_user.name}")
  end

  def selector
    @distribution = Distribution.find(params[:consumption_id])
    redirect_to consumer_distribution_path(@consumer, @distribution)
  end

  private

  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end

end
