require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'should be valid' do
    category = Category.new(name: 'Toys')
    expect(category).to be_valid
  end

   it 'should be invalid with an empty string as a name' do
    bad = Category.new(name: '')
    expect(bad).to be_invalid
  end
end
