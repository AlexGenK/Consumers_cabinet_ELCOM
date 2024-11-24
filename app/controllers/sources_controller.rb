class SourcesController < ApplicationController
  include Verifiable
  before_action :set_consumer
  before_action :detect_invalid_user
  authorize_resource :class => false

  def index
  end
  
  private
  
  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end
end
