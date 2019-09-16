class Arrival < ApplicationRecord
  belongs_to :cd
  attachment :jacket
  # has_many :cds, dependent: :destroy
end
