require 'rails_helper'

RSpec.describe MatchesController, type: :controller do

 describe "DESTROY #delete" do
  it 'should delete match' do
     candle = Product.create(title: "Candle", description: "it kind of smells of flowers")
     smells = Category.create(name: "Smells")
     element = Match.create(product_id: candle.id, category_id: smells.id)
    expect { delete :destroy, params: { id: element.id } }.to change(Match, :count).by(-1)
  end
 end

end

RSpec.describe MatchesController, type: :routing do
 describe 'routing' do
    it 'routes to #delete via DESTROY' do
     expect(delete: '/matches/1').to route_to('matches#destroy', id: '1')
    end
  end
end
