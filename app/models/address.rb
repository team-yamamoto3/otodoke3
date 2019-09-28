class Address < ApplicationRecord
	belongs_to :enduser
	validate :check
	validates :tell, presence: true
	validates :postal_code, presence: true
	validates :address, presence: true

	def check
		if enduser && enduser.addresses.count > 3
			errors.add(:enduser, "3つまで")
		end
	end
end
