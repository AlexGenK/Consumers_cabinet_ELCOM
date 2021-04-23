class Consumer < ApplicationRecord
	has_many :payments, dependent: :destroy
end
