Rails.application.routes.draw do
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#show"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end
