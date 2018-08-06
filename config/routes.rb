Rails.application.routes.draw do

  get 'matches/new'
  get 'matches/create'
  get 'matches/destroy'
  root to: 'categories#index'

  resources :categories, only: [:show, :index, :destroy]
  resources :products
  get '/products/:id', to: 'products#show', as: 'show'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
