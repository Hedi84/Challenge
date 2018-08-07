class Category < ApplicationRecord
  # when a category or product is deleted, the match should be too
  has_many :matches, dependent: :destroy
  has_many :products, through: :matches
  validates :name, uniqueness: true
end
