class ConsumersController < ApplicationController
  def index
    @consumers=Consumer.order(:name)
  end
end
