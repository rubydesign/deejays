Rails.application.routes.draw do
  resources :songs
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
