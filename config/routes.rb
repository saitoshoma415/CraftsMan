Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :reservation, only: %i(new create edit update destroy)
end
