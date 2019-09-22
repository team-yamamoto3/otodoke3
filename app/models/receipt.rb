class Receipt < ApplicationRecord
	has many :orders
	# validates :sum_price, presence: true, allow_nil: true
end
