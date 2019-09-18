class Cart < ApplicationRecord
	belong_to :enduser
	belong_to :cd
end
