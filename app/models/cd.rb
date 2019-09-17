class Cd < ApplicationRecord

  has_many :arrivals, dependent: :destroy
  has_many :artists, dependent: :destroy
  accepts_nested_attributes_for :artists
  has_many :songs, dependent: :destroy
  attachment :jacket


  def self.search(search)
  	return Cd.all unless search
  	Cd.where(['content LIKE >', "%#{search}%"])
  end

end
