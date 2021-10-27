class FtpProfile < ApplicationRecord
  validates :host,      presence: true
  validates :port,      presence: true
  validates :username,  presence: true
  validates :password,  presence: true

  def dec_password
    if self.password == nil
      return nil
    else
      return EncryptionService.decrypt(self.password) 
    end
  end

  def dec_password=(value)
    self.password = EncryptionService.encrypt(value)
  end
    
  def set_current
    FtpProfile.update_all(default: false)
    self.default = true
    self.save
  end

  def self.get_current
    FtpProfile.find_by(default: true)
  end
end
