class Photo < ApplicationRecord
  has_many :selections, dependent: :destroy
  has_many :carts, through: :selections
  validates :title, presence: true

end
