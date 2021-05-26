class Admin::FillingDcertificatesController < ApplicationController
  include Parsed

  skip_before_action :verify_authenticity_token
  authorize_resource :class => false

  require 'net/ftp'

  def set_params
  end
  
  def start
    @add_certs = []
    Net::FTP.open(ENV['CONSUMERS_CABINET_ELCOM_FTP_HOST'], 
                  port: ENV['CONSUMERS_CABINET_ELCOM_FTP_PORT'],
                  username: ENV['CONSUMERS_CABINET_ELCOM_FTP_USERNAME'],
                  password: ENV['CONSUMERS_CABINET_ELCOM_FTP_PASSWORD'],) do |ftp|
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
  end
end
