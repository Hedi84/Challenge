class Match < ApplicationRecord
  belongs_to :category
  belongs_to :product
  # A product should not be added to a category more than once
  validates :product, uniqueness: {scope: :category}
end
