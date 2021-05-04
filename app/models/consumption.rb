class Consumption < ApplicationRecord
  belongs_to :consumer

  def text_period
    "#{UA_MONTHS_SINGLE[self.period.month]} #{self.period.year}"
  end

  def year
    self.period.year
  end
end
