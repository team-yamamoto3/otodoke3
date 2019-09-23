class Address < ApplicationRecord
	belongs_to :enduser
	validate :check

	def check
		if enduser && enduser.addresses.count >= 3
			errors.add(:enduser, "3つまで")
		end
	end
end
