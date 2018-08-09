Rails.application.routes.draw do


  root to: 'categories#index'
  resources :categories, except: [:update]
  resources :products do
    resources :matches, only:[:new, :create]
  end
  resources :matches, only: [:destroy]
  get '/products/:id', to: 'products#show', as: 'show'
  get '/products/:id', to: 'products#destroy', as: 'delete'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
