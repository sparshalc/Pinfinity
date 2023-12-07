class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         followability

  with_options dependent: :destroy do 
    has_many :messages
    has_many :boards
    has_many :pins
    has_many :comments
    has_many :notifications, as: :recipient
  end

  has_one_attached :image

  def name
    email.split('@')[0].capitalize!
  end

end
