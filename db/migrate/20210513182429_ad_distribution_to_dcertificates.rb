class AdDistributionToDcertificates < ActiveRecord::Migration[6.1]
  def change
  	add_reference :dcertificates, :distribution, foreign_key: true
  end
end
