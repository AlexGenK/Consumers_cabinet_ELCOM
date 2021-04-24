class Payment < ApplicationRecord
  belongs_to :consumer

  def textualize
    "До #{self.date} числа #{UA_PERIOD_FULL[self.period]}"
  end
end
