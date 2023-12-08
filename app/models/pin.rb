class Pin < ApplicationRecord

  with_options dependent: :destroy do 
    has_many :comments
    has_many :likes
  end

  belongs_to :board
  belongs_to :user

  validates :image,presence: true
  
  has_one_attached :image
end
