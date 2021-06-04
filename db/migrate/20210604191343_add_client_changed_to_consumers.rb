class AddClientChangedToConsumers < ActiveRecord::Migration[6.1]
  def change
    add_column :consumers, :client_changed, :boolean, default: false
  end
end
