Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  # get '/users' => 'users#index'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  root to: "posts#index"

  resources :users do
    resources :posts
  end

end
