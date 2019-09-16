class Cd < ApplicationRecord
  has_many :arrivals, dependent: :destroy
    # belongs_to :arrival
end
