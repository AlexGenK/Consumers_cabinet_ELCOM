class ConsumersController < ApplicationController
  before_action :set_consumer, only: [:edit, :update, :destroy]

  def index
    @consumers=Consumer.order(:name)
  end

  def new
    @consumer = Consumer.new
  end

  def create
    @consumer = Consumer.new(consumer_params)
    if @consumer.save
      redirect_to consumers_path, notice: "Споживач #{@consumer.name} успішно створений"
    else
      flash[:alert] = 'Неможливо створити споживача'
      render :new
    end
  end

  def destroy
    @consumer.destroy
    redirect_to consumers_path
  end

  private

  def consumer_params
    params.require(:consumer).permit(:name, :full_name, :edrpou, :inn, :director,
                                     :bank, :mfo, :account, :address, :phone, :mail,
                                     :dog_en_number, :dog_en_date, :distribution,
                                     :client_username, :manager_username, :onec_id)
  end

  def set_consumer
    @consumer = Consumer.find(params[:id])
  end
end
