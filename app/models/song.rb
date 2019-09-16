class Song < ApplicationRecord
  belongs_to :cd
  belongs_to :disc
end
