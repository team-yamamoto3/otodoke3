class Cd < ApplicationRecord

  has_many :arrivals, dependent: :destroy
  attachment :jacket


  def self.search(search)
  	return Cd.all unless search
  	Cd.where(['content LIKE >', "%#{search}%"])
  end

end
