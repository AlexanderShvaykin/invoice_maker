Rails.application.routes.draw do
  root 'home#index'
  resources :user_sessions, only: %i[create]
  get :login, to: "user_sessions#new"
  get :logout, to: "user_sessions#destroy"

  get :registration, to: "users#new"
  resources :users, only: %i[create] do
    get :citizen, to: "citizens#edit", on: :member
  end

  resources :citizens, only: %i[create update]

  resources :organizations, only: %i[index create new destroy edit update] do
    resources :invoices, only: %i[new create]
  end

  resources :invoices, only: %i[index show destroy]
end
