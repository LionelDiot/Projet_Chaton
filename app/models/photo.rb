class Photo < ApplicationRecord
  has_many :selections
  has_many :carts, through: :selections
  validates :title, presence: true
end
