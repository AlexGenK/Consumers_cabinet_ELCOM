class CreateEicCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :eic_codes do |t|
      t.string :code
      t.references :consumer

      t.timestamps
    end
  end
end
