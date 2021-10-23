class FtpProfile < ApplicationRecord
  validates :host,      presence: true
  validates :port,      presence: true
  validates :username,  presence: true
  validates :password,  presence: true

  def set_current
    FtpProfile.update_all(default: false)
    self.default = true
    self.save
  end

  def self.get_current
    FtpProfile.find_by(default: true)
  end
end
