class CreatePurveyors < ActiveRecord::Migration[6.1]
  def change
    create_table :purveyors do |t|
      t.text :full_name
      t.text :director
      t.string :edrpou
      t.string :inn
      t.text :account
      t.text :bank
      t.string :mfo
      t.string :address
      t.text :phone
      t.string :mail

      t.timestamps
    end
  end
end
