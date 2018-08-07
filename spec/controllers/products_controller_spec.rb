require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  params = { id: 15 }

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end


  describe "POST #create" do
    it "creates a new product" do
     shaver = Product.create(title: 'Shaver', description: 'smooth legs and chest whenever')
     expect(shaver.title).to eq("Shaver")
    end
  end




end

