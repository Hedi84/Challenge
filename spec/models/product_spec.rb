require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'should be valid' do
    lamp = Product.new(title: 'Ceiling lamp', description: 'Bright and White')
    expect(lamp).to be_valid
  end
end





