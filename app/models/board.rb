class Board < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  scope :public_board, -> { where(isPrivate: false) }
end
