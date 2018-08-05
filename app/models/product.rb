class Product < ApplicationRecord
  has_many :matches
  has_many :categories, through: :matches
end
