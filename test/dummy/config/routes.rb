Rails.application.routes.draw do
  get '/private', to: 'products#private'
  resources :products
end
