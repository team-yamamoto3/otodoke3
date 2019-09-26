class Song < ApplicationRecord
  belongs_to :disc, inverse_of: :songs
  validates :song, presence: true
  validates :songorder, presence: true
end
