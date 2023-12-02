class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options dependent: :destroy do 
    has_many :messages
    has_many :boards
    has_many :pins
    has_many :comments
  end

  has_one_attached :image

  def name
    email.split('@')[0].capitalize!
  end

end
