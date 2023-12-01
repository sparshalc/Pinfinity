class Board < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :pins

  scope :public_board, -> { where(isPrivate: false) }
end
