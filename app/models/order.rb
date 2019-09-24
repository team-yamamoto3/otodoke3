class Order < ApplicationRecord
	belongs_to :cd
	belongs_to :receipt
end
