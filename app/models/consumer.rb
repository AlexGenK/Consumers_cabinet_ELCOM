class Consumer < ApplicationRecord
	has_many :payments, dependent: :destroy
	has_many :eic_codes, dependent: :destroy
	has_many :consumptions, dependent: :destroy
	has_many :distributions, dependent: :destroy
end
