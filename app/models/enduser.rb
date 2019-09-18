class Enduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :postal_code, presence: true
  validates :user_address, presence: true
  validates :user_tell, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.search(search)
        return Enduser.all unless search
        Enduser.where(['last_name ? OR first_name LIKE ?', "%#{search}%", "%#{search}%"])
  end

  acts_as_paranoid
end
