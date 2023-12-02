class Pin < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :image,presence: true
  
  has_one_attached :image
end
