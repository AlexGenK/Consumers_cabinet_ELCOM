class ChangeDustribitionToDistributionFromConsumers < ActiveRecord::Migration[6.1]
  def change
  	rename_column :consumers, :dustribution, :distribution
  end
end
