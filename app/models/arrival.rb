class Arrival < ApplicationRecord
  belongs_to :cd
  validates :arrival_new, presence: true
  validates :arrival_day, presence: true
  # attachment :jacket
end
