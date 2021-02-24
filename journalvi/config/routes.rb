Rails.application.routes.draw do  
  resources :scores
  resources :prompts
  resources :entries
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
