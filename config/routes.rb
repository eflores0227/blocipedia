Rails.application.routes.draw do
  resources :collaborators
  resources :wikis
  resources :charges
  get "welcome/index"
  get "welcome/about"
  root "welcome#index"

  devise_for :users
  resources :users

end
