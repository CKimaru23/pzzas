Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :destroy] do
    resources :pizzas, only: [:index, :show, ], controller: 'restaurant_pizzas'
  end

  resources :pizzas, only: [:index]

  
  get '/restaurants', to: 'restaurants#show'
  get '/restaurants/:id', to:'restaurants#show'
  destroy '/restaurants/:id', to: 'restaurants#destroy'

  get '/pizzas', to: 'pizzas#show'



  post '/restaurant_pizzas', to: 'restaurant_pizzas#create'

end
