class Cart < ApplicationRecord
  belongs_to :user
  has_many :selections
  has_many :items, through: :selections
end
