class Admin::FillingDcertificatesController < ApplicationController
  include Parsed

  skip_before_action :verify_authenticity_token
  authorize_resource :class => false

  require 'net/ftp'

  def set_params
  end
  
  def start
    @add_certs = []
    @ftp_profile = FtpProfile.get_current
    begin
      Net::FTP.open(@ftp_profile.host, 
                    port:     @ftp_profile.port,
                    username: @ftp_profile.username,
                    password: @ftp_profile.password,) do |ftp|
        ftp.nlst.each do |filename|
          if filename[0] == 'D'
            @consumer = Consumer.find_by(onec_id: parse_id(filename))
            if @consumer
                @cert_date = parse_date(filename)
                @distribution = @consumer.distributions.where('extract(year from period) = ? AND extract(month from period) = ?', @cert_date.year, @cert_date.month).first
                if @distribution
                  @distribution.dcertificate&.destroy
                  @cert_number = parse_number(filename)
                  @cert = @distribution.build_dcertificate(number: @cert_number, date: @cert_date)
                  @cert.save!
                  ftp.getbinaryfile(filename, 'public/akt.pdf')
                  @cert.print_form.attach(io: File.open('public/akt.pdf'), filename: 'akt.pdf', content_type: 'application/pdf')
                  @add_certs << "Споживач #{@consumer.name} (#{@consumer.edrpou}) - Акт №#{@cert.number} від #{@cert.date}"
                end
            end
          end
        end
      end
    rescue
      flash[:alert] = "Неможливо з'єднається з FTP-сервером #{@ftp_profile.host}. Перевірте налаштування FTP."
      render :set_params
    end
  end
end
