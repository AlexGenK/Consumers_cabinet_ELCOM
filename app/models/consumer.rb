class Consumer < ApplicationRecord
	has_many :payments, dependent: :destroy
	has_many :consumptions, dependent: :destroy
end
