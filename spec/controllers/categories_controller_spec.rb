require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
  it 'should success and render to show page' do
    sports = Category.create!(name: 'Sports')
    get :show, params: { id: sports.id }
    expect(response).to have_http_status(200)
    expect(response).to render_template :show
   end
  end


  describe "POST #create" do
    it "creates a new category" do
     trips = { name: 'Trips' }
     expect { post(:create, params: { category: trips }) }.to change(Category, :count).by(1)
    end
  end


 describe "DESTROY #delete" do
  it 'should delete product' do
    elements = Category.create!(name: "Elements")
    expect { delete :destroy, params: { id: elements.id } }.to change(Category, :count).by(-1)
  end
 end


end


RSpec.describe CategoriesController, type: :routing do
 describe 'routing' do

  it 'routes to #index' do
   expect(get: '/categories').to route_to('categories#index')
  end

  it 'routes to #show' do
   expect(get: '/categories/1').to route_to('categories#show', id: '1')
  end

 end
end
