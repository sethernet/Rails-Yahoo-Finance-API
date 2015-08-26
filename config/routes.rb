Rails.application.routes.draw do

  root 'stocks#index'
  
  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/account' => 'users#show'
  patch '/users' => 'users#show'

  resources :stocks
  resources :quotes
  resources :users
  resources :portfolios
  resources :password_resets
  

end
