class Admin::FtpProfilesController < ApplicationController
  before_action :set_ftp_profile, only: [:edit, :update, :destroy, :curent]
  load_and_authorize_resource

  def index
    @ip = request.remote_ip
    @ftp_profiles = FtpProfile.order(:name, :host, :port)
  end

  def new
    @ftp_profile = FtpProfile.new
  end

  def current
    @ftp_profile.set_current
    redirect_to admin_ftp_profiles_path
  end

  def create
    @ftp_profile = FtpProfile.new(ftp_profile_params)
    if @ftp_profile.save
      redirect_to admin_ftp_profiles_path, notice: "Профіль #{@ftp_profile.name} успішно створений"
    else
      flash[:alert] = 'Неможливо створити профіль'
      render :new
    end
  end

  def edit
  end

  def update
    if @ftp_profile.update(ftp_profile_params)
      redirect_to admin_ftp_profiles_path, notice: "Профіль #{@ftp_profile.name} успішно відредагований"
    else
      flash[:alert] = 'Неможливо відредагувати профіль'
      render :edit
    end
  end

  def destroy
    if @ftp_profile.destroy
      flash[:notice] = "Профіль #{@ftp_profile.name} успішно видалений"
    else
      flash[:alert] = 'Неможливо видалити профіль'
    end
    redirect_to admin_ftp_profiles_path
  end

  private

  def ftp_profile_params
    params.require(:ftp_profile).permit(:host, :port, :username, :password,
                                        :default, :name)
  end

  def set_ftp_profile
    @ftp_profile = FtpProfile.find(params[:id])
  end
end
