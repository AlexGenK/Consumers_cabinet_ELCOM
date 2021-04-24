class PaymentsController < ApplicationController
  before_action :set_consumer
  before_action :set_payment, only: [:destroy]

  def index
    @payments = @consumer.payments.all.order(:period, :date)
    @payment =  @consumer.payments.new
  end

  def create
    @payment = @consumer.payments.new(payment_params)
    if (@consumer.payments.sum(:percent) + @payment.percent.to_i) > 100
      flash[:alert] = 'Неможливо створити платіж. Планові платежі перевищили 100%'
    else
      flash[:alert] = 'Неможливо створити платіж. Введіть коректні значення' unless @payment.save
    end
    redirect_to consumer_payments_path(@consumer)
  end

  def destroy
    flash[:alert] = 'Неможливо видалити платіж' unless @payment.destroy
    redirect_to consumer_payments_path(@consumer)
  end

  private

  def payment_params
    params.require(:payment).permit(:date, :period, :percent)
  end

  def set_consumer
    @consumer = Consumer.find(params[:consumer_id])
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end
end
