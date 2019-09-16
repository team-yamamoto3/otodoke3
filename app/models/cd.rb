class Cd < ApplicationRecord

  has_many :arrivals, dependent: :destroy
  attachment :jacket



end
