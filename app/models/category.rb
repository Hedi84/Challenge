class Category < ApplicationRecord
  has_many :matches
  has_many :products, through: :matches
end
