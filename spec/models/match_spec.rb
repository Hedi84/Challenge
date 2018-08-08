require 'rails_helper'

RSpec.describe Match, type: :model do

  it 'should be valid' do
    new_product = Product.create(title: 'Shoe', description: 'A singular shoe')
    new_category = Category.create(name: 'Footwear')
    new_match = Match.create(product_id: new_product.id, category_id: new_category.id)
    expect(new_match).to be_valid
  end

  it 'should be possible to add multiple products to a category' do
    product_1 = Product.create(title: 'Funzo', description: 'A Simpsons based toy')
    category_1 = Category.create(name: 'Soft Toys')
    category_2 = Category.create(name: 'Fun')
    category_3 = Category.create(name: 'Children')
    match_1 = Match.create(product_id: product_1.id, category_id: category_1.id)
    match_2 = Match.create(product_id: product_1.id, category_id: category_2.id)
    match_3 = Match.create(product_id: product_1.id, category_id: category_3.id)
    expect(product_1.categories.count).to eq(3)
  end


  it "should not be possible to create a match without a category" do
      dinky_toy = Product.create(title: 'Dinky Toy', description: 'A miniature car')
      match_dinky = Match.create(product_id: dinky_toy.id, category_id: 14)
      expect(match_dinky.errors[:category]).to include('must exist')
  end
end

