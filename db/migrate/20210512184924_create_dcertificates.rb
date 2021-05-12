class CreateDcertificates < ActiveRecord::Migration[6.1]
  def change
    create_table :dcertificates do |t|
      t.string :number
      t.date :date

      t.timestamps
    end
  end
end
