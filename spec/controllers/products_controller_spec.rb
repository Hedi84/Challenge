require 'rails_helper'

RSpec.describe ProductsController, type: :controller do


  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
  it 'should success and render to show page' do
    plate = Product.create!(title: 'Plate', description: 'it holds food')
    get :show, params: { id: plate.id }
    expect(response).to have_http_status(200)
    expect(response).to render_template :show
   end
  end


  describe "POST #create" do
    it "creates a new product" do
     shaver = { title: 'Shaver', description: 'smooth legs and chest whenever' }
     expect { post(:create, params: { product: shaver }) }.to change(Product, :count).by(1)
    end
  end

  describe "Post #update" do
    it "updates a product" do
      awesome = Product.create!(title: "Awesome product", description: "it's okay")
      params = {
      title: 'Awesome product',
      description: "just fab"
      }
     put :update, params: {id: awesome.id, product: params }
     awesome.reload
     params.keys.each do |key|
      expect(awesome.attributes[key.to_s]).to eq params[key]
   end
  end
 end

 describe "DESTROY #delete" do
  it 'should delete product' do
    fire = Product.create!(title: "Fire insurance", description: "let's hope it doesn't happen")
    expect { delete :destroy, params: { id: fire.id } }.to change(Product, :count).by(-1)
  end
 end


end


RSpec.describe ProductsController, type: :routing do
 describe 'routing' do

  it 'routes to #index' do
   expect(get: '/products').to route_to('products#index')
  end

  it 'routes to #show' do
   expect(get: '/products/1').to route_to('products#show', id: '1')
  end

  it 'routes to #new' do
   expect(get: '/products/new').to route_to('products#new')
  end

  it 'routes to #update via PATCH' do
   expect(patch: '/products/1').to route_to('products#update', id: '1')
  end

  it 'routes to #delete via DESTROY' do
   expect(delete: '/products/1').to route_to('products#destroy', id: '1')
  end
 end
end
