class Cd < ApplicationRecord

  has_many :arrivals, dependent: :destroy
  has_many :artisits, dependent: :destroy
  has_many :songs, dependent: :destroy
  attachment :jacket


  def self.search(search)
  	return Cd.all unless search
  	Cd.where(['content LIKE >', "%#{search}%"])
  end

end
