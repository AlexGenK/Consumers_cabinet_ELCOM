class CreateConsumers < ActiveRecord::Migration[6.1]
  def change
    create_table :consumers do |t|
      t.integer :onec_id
      t.string :name
      t.string :full_name
      t.string :edrpou
      t.string :inn
      t.text :director
      t.text :bank
      t.string :mfo
      t.text :account
      t.text :address
      t.text :phone
      t.string :mail
      t.string :dog_en_number
      t.date :dog_en_date
      t.boolean :dustribution
      t.string :client_username
      t.string :manager_username

      t.timestamps
    end
  end
end
