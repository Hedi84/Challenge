require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'should be valid' do
    lamp = Product.new(title: 'Ceiling lamp', description: 'Bright and White')
    expect(lamp).to be_valid
  end

  it "creates a new product" do
    shaver = Product.create(title: 'Shaver', description: 'smooth legs and chest whenever')
    expect(shaver.title).to eq("Shaver")
  end

  it 'should be invalid with an empty string as a title' do
    naughty = Product.new(title: '')
    expect(naughty).to be_invalid
  end
end



