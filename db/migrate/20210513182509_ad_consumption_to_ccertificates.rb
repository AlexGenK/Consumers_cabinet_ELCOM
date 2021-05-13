class AdConsumptionToCcertificates < ActiveRecord::Migration[6.1]
  def change
  	add_reference :ccertificates, :consumption, foreign_key: true
  end
end
