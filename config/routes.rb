Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :destroy]

  resources :pizzas, only: [:index, :show, :destroy, :update]
  resources :restaurant_pizzas, only: [:index, :show, :destroy, :update]

  
  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/:id', to:'restaurants#show'
  delete '/restaurants/:id', to: 'restaurants#destroy'

  get '/pizzas', to: 'pizzas#index' 
  get '/pizzas/:id', to: 'pizzas#show' 
  post '/pizzas', to: 'pizzas#create' 
  patch '/pizzas/:id', to: 'pizzas#update' 
  delete '/pizzas/:id', to: 'pizzas#destroy' 
  
  post '/restaurant_pizzas', to: 'restaurant_pizzas#create' 
  get '/restaurant_pizzas/:id', to: 'restaurant_pizzas#show'
  patch '/restaurant_pizzas/:id', to: 'restaurant_pizzas#update' 
  delete '/restaurant_pizzas/:id', to: 'restaurant_pizzas#destroy' 

end
