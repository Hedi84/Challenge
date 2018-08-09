class Product < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :categories, through: :matches
  validates :title, presence: true, uniqueness: true
end

