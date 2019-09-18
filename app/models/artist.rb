class Artist < ApplicationRecord
  belongs_to :cd, inverse_of: :artists
end
