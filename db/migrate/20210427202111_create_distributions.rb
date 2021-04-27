class CreateDistributions < ActiveRecord::Migration[6.1]
  def change
    create_table :distributions do |t|
      t.date :period
      t.decimal :opening_balance, precision: 13, scale: 2
      t.decimal :money, precision: 13, scale: 2
      t.decimal :cost, precision: 13, scale: 2
      t.decimal :closing_balance, precision: 13, scale: 2
      t.references :consumer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
