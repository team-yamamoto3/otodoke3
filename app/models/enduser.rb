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
  
  def full_name
    self.first_name + self.last_name
  end

  acts_as_paranoid
end
