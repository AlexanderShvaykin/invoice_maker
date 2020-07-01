Rails.application.routes.draw do
  root 'home#index'
  resources :user_sessions, only: %i[create]
  get :login, to: "user_sessions#new"
  get :logout, to: "user_sessions#destroy"

  resources :users, only: %i[create]
  get :registration, to: "users#new"
end
