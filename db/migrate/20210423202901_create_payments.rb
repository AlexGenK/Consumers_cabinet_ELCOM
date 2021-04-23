class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :date
      t.integer :period
      t.integer :percent
      t.references :consumer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
