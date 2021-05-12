class Distribution < ApplicationRecord
  belongs_to :consumer
  has_one :dcertificate, dependent: :destroy

   def text_period
    "#{UA_MONTHS_SINGLE[self.period.month]} #{self.period.year}"
  end
end
