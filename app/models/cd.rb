class Cd < ApplicationRecord

  # カート機能
  has_many :carts
  def carted_by?(enduser)
    carts.where(enduser_id: enduser.id).exists?
  end

  has_many :arrivals, dependent: :destroy
  has_many :artists, dependent: :destroy, inverse_of: :cd
  accepts_nested_attributes_for :artists
  attachment :jacket
  has_many :discs, dependent: :destroy, inverse_of: :cd
  accepts_nested_attributes_for :discs, allow_destroy: true
  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs
  paginates_per 2

  def self.search(search)
  	return Cd.all unless search
  	Cd.where(['content LIKE >', "%#{search}%"])
  end

end
