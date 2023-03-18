Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :destroy] do
    resources :pizzas, only: [:index], controller: 'restaurant_pizzas'
  end

  resources :pizzas, only: [:index, :show, :destroy, :update]

  
  get '/restaurants', to: 'restaurants#show'
  get '/restaurants/:id', to:'restaurants#show'
  destroy '/restaurants/:id', to: 'restaurants#destroy'

  get '/pizzas', to: 'pizzas#show'
  get '/pizzas/:id', to:'pizzas#show'
  create '/pizzas/:id', to:'pizzas#create'
  update '/pizzas/:id', to:'pizzas#update'
  delete '/pizzas/:id', to:'pizzas#destroy'

  get '/restaurant_pizzas/:id', to: 'restaurant_pizzas#show'
  get '/restaurant_pizzas', to: 'restaurant_pizzas#show'
  post '/restaurant_pizzas/:id', to: 'restaurant_pizzas#create'
  update '/restaurant_pizzas/:id', to: 'restaurant_pizzas#update'
  destroy '/restaurant_pizzas/:id', to: 'restaurant_pizzas#destroy'

end
