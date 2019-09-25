class Disc < ApplicationRecord
  belongs_to :cd
  has_many :songs, dependent: :destroy, inverse_of: :disc
  accepts_nested_attributes_for :songs, allow_destroy: true

  validates :disc_name, presence: true
  validates :include, presence: true
  validates :disc_number, presence: true
end
