class Cart < ApplicationRecord
	belongs_to :enduser
	belongs_to :cd
	# validates :sum_price, presence: true, allow_nil: true
end
