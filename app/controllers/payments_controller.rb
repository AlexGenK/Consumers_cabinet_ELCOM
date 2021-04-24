class PaymentsController < ApplicationController
	before_action :set_consumer

	def index
	end

	private

  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end
end
