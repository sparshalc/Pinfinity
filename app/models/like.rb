class Like < ApplicationRecord
  validates :user, uniqueness: { scope: :pin_id }
  belongs_to :user
  belongs_to :pin
end
