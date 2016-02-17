Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create]
  get "welcome/index"
  get "welcome/about"
  root "welcome#index"

  devise_for :users
  resources :users, only: [:new, :create, :show]

end
