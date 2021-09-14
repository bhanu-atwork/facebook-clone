Rails.application.routes.draw do
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#show"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:show]
  resources :posts, only: [:create, :show]
  resources :likes, only: [:create, :destroy]
  resources :friends, only: [:create, :show, :update]
  resources :comments, only: [:create]
end
