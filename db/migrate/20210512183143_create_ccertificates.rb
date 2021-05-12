class CreateCcertificates < ActiveRecord::Migration[6.1]
  def change
    create_table :ccertificates do |t|
      t.string :number
      t.date :date

      t.timestamps
    end
  end
end
