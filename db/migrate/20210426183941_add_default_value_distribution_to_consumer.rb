class AddDefaultValueDistributionToConsumer < ActiveRecord::Migration[6.1]
  def change
  	change_column :consumers, :distribution, :boolean, default: true
  end
end
