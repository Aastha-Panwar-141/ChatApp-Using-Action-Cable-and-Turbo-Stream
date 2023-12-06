Rails.application.routes.draw do
  get 'sessions/create'
  get 'rooms/show'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root to: "home#index"

  root to: "rooms#index"
  # root to: "rooms#show"

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :rooms do
    resources :messages
  end

end
