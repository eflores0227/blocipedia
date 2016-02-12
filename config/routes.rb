Rails.application.routes.draw do
  get "welcome/index"
  get "welcome/about"
  root "welcome#index"

  devise_for :users
  resources :users, only: [:new, :create, :show]
  post "users/confirm" => "users#confirm"
end
