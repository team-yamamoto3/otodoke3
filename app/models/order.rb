class Order < ApplicationRecord
	belongs_to :cds
	belongs_to :receopt
end
