class Admin::FtpProfilesController < ApplicationController
  load_and_authorize_resource

  def index
    @ip = request.remote_ip
    @ftp_profiles = FtpProfile.order(:host)
  end

  def new
    @ftp_profile = FtpProfile.new
  end

  def create
    @ftp_profile = FtpProfile.new(ftp_profile_params)
    if @ftp_profile.save
      redirect_to admin_ftp_profiles_path, notice: "Профіль хоста #{@ftp_profile.host} успішно створений"
    else
      flash[:alert] = 'Неможливо створити профіль'
      @ftp_profile.validate!
      p @ftp_profile.errors.full_messages
      render :new
    end
  end

  private

  def ftp_profile_params
    params.require(:ftp_profile).permit(:host, :port, :username, :password,
                                        :default)
  end
end
