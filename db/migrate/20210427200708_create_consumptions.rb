class CreateConsumptions < ActiveRecord::Migration[6.1]
  def change
    create_table :consumptions do |t|
      t.date :period
      t.decimal :opening_balance, precision: 13, scale: 2
      t.decimal :money, precision: 13, scale: 2
      t.integer :power
      t.decimal :cost, precision: 13, scale: 2
      t.decimal :closing_balance, precision: 13, scale: 2
      t.references :consumer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
