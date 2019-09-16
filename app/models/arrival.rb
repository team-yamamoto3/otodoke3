class Arrival < ApplicationRecord
  belongs_to :cd
  # has_many :cds, dependent: :destroy
end
