class Admin::FillingCcertificatesController < ApplicationController
  include Parsed

  skip_before_action :verify_authenticity_token
  authorize_resource :class => false

  require 'net/ftp'

  def start
    @add_certs = []
    Net::FTP.open(ENV['CONSUMERS_CABINET_ELCOM_FTP_HOST'], 
                  port: ENV['CONSUMERS_CABINET_ELCOM_FTP_PORT'],
                  username: ENV['CONSUMERS_CABINET_ELCOM_FTP_USERNAME'],
                  password: ENV['CONSUMERS_CABINET_ELCOM_FTP_PASSWORD'],) do |ftp|
      ftp.chdir('c')
      ftp.nlst.each do |filename|
        @consumer = Consumer.find_by(onec_id: parse_id(filename))
        if @consumer
            @cert_date = parse_date(filename)
            @consumption = @consumer.consumptions.where('extract(year from period) = ? AND extract(month from period) = ?', @cert_date.year, @cert_date.month).first
            if @consumption
              @consumption.ccertificate&.destroy
              @cert_number = parse_number(filename)
              @cert = @consumption.build_ccertificate(number: @cert_number, date: @cert_date)
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
