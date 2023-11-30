class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_one_attached :image

  def name
    email.split('@')[0].capitalize!
  end
end
