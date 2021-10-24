class AddNameToFtpProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :ftp_profiles, :name, :string
  end
end
