class Category < ApplicationRecord
  has_many :matches
  has_many :products, through: :matches
  validates :name, uniqueness: true
end
