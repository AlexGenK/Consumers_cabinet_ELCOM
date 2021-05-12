class Consumption < ApplicationRecord
  belongs_to :consumer
  has_one :ccertificate, dependent: :destroy

  def text_period
    "#{UA_MONTHS_SINGLE[self.period.month]} #{self.period.year}"
  end

  def year
    self.period.year
  end
end
