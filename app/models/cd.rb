class Cd < ApplicationRecord

  has_many :arrivals #, dependent: :destroy
  has_many :artists, dependent: :destroy, inverse_of: :cd
  accepts_nested_attributes_for :artists
  attachment :jacket
  has_many :discs, dependent: :destroy, inverse_of: :cd
  accepts_nested_attributes_for :discs, allow_destroy: true
  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs
  has_many :orders
  paginates_per 5

  # validates
  validates :sales_status, presence: true
  validates :price, presence: true
  validates :consumption_tax, presence: true
  validates :stock, presence: true
  validates :title, presence: true
  validates :genre, presence: true
  validates :label, presence: true
  # validates_presence_of :price , :message => ”値段を入力してください"
  # attachment :jacket

  def self.search(search)
  	return Cd.all unless search
  	Cd.where(['content LIKE >', "%#{search}%"])
  end

    # カート機能
    has_many :carts
    def carted_by?(enduser)
      carts.where(enduser_id: enduser.id).exists?
    end
    
    def cart_by?(user_id, cd_id)
      carts.where(enduser_id: user_id, cd_id: cd_id).exists?
  # validates :sum_price, presence: true, allow_nil: true
    end
end
