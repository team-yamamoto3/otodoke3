class Cd < ApplicationRecord

  # カート機能
  belongs_to :enduser
  has_many :carts
  def carted_by?(enduser)
    carts.where(enduser_id: enduser.id).exists?
  end

  has_many :arrivals, dependent: :destroy
  has_many :artists, dependent: :destroy
  accepts_nested_attributes_for :artists
  attachment :jacket
  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs
  has_many :discs, dependent: :destroy
  accepts_nested_attributes_for :discs

  def self.search(search)
  	return Cd.all unless search
  	Cd.where(['content LIKE >', "%#{search}%"])
  end

end
