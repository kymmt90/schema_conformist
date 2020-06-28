Rails.application.routes.draw do
  get '/private', to: 'products#private'
  resources :products
  resources :invalid_products, only: :create
end
