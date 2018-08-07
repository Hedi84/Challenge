require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'should be valid' do
    category = Category.new(name: 'Toys')
    expect(category).to be_valid
  end
end
