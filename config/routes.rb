Rails.application.routes.draw do
  resources :maps
  get 'home/index'

  devise_for :users
  resources :things
  resources :comments
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: "home#index"
end
