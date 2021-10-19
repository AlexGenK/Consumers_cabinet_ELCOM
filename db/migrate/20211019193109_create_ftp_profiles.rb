class CreateFtpProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :ftp_profiles do |t|
      t.string :host
      t.integer :port, default: 21
      t.string :username
      t.string :password
      t.boolean :default, default: false

      t.timestamps
    end
  end
end
