class FtpProfile < ApplicationRecord
  validates :host,      presence: true
  validates :port,      presence: true
  validates :username,  presence: true
  validates :password,  presence: true
  validates :default,   presence: true
end
