class ConsumersController < ApplicationController
  before_action :set_consumer, only: [:edit, :update, :destroy, :show]
  before_action :set_users_list, only: [:new, :edit, :create]
  load_and_authorize_resource

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

  def edit
  end

  def update
    if @consumer.update(consumer_params)
      redirect_to consumer_path(@consumer), notice: "Споживач #{@consumer.name} успішно відредагований"
    else
      flash[:alert] = 'Неможливо відредагувати споживача'
      render :edit
    end
  end

  def destroy
    if @consumer.destroy
      flash[:notice] = "Споживач #{@consumer.name} успішно видалений"
    else
      flash[:alert] = 'Неможливо видалити споживача'
    end
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

  def set_users_list
    @managers = User.where("manager_role").order(:name).collect(&:name)
    @clients = User.where("client_role").order(:name).collect(&:name)
  end
end
