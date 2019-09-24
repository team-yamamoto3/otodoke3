class Receipt < ApplicationRecord
	has_many :orders
	# validates :sum_price, presence: true, allow_nil: true
	belongs_to :enduser
end
