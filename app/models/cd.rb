class Cd < ApplicationRecord

  has_many :arrivals, dependent: :destroy
  has_many :artisits, dependent: :destroy
  has_many :songs, dependent: :destroy
  attachment :jacket



end
