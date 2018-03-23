Rails.application.routes.draw do
  root 'static_pages#home'

  resources :users
  resources :attractions

  # sessions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  # rides
  post '/rides/new' => 'rides#new'
end
