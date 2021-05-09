class DistributionsController < ApplicationController
  before_action :set_consumer
  load_and_authorize_resource

  def index
    @distributions = @consumer.distributions.all.order(period: :desc)
    @distribution = @distributions.first
    redirect_to consumer_distribution_path(@consumer, @distribution) if @distribution
  end

  def show
     @distributions = @consumer.distributions.all.order(period: :desc)
     @distribution = Distribution.find(params[:id])
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
