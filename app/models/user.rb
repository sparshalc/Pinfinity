class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         followability 

  with_options dependent: :destroy do 
    has_many :rooms
    has_many :messages
    has_many :likes
    has_many :boards
    has_many :pins
    has_many :comments
    has_many :notifications, as: :recipient
  end

  has_one_attached :image

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  def name
    email.split('@')[0].capitalize!
  end

end
