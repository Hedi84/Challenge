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

 describe "post #create" do
  it 'should create match' do
     feather = Product.create(title: "Feather", description: "it tickles")
     birds = Category.create(name: "Birds")
     params_match = {product_id: feather.id, category_id: birds.id}
     expect { post(:create, params: { match: params_match }) }.to change(Match, :count).by(1)
   end
end


end

RSpec.describe MatchesController, type: :routing do
  describe 'routing' do

      it 'routes to #delete via DESTROY' do
       expect(delete: '/matches/1').to route_to('matches#destroy', id: '1')
      end

     it 'routes to #new' do
      expect(get: '/products/1/matches/new').to route_to('matches#new', product_id: '1')
     end
  end
end
