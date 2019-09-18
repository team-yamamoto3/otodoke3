class Enduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # カート機能 has_many
  # has_many :cds, dependent: :destroy
  has_many :carts


  validates :postal_code, presence: true
  validates :user_address, presence: true
  validates :user_tell, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.search(search,kennsaku)
      if search
        Enduser.where(['last_name LIKE ?', "%#{search}%"])
        Enduser.where(['first_name LIKE ?', "%#{kennsaku}%"])
      else
      end
  end


  acts_as_paranoid
end
