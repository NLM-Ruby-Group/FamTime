Rails.application.routes.draw do
  resources :comments
  resources :events
  resources :places
  root 'home#index'

  resources :users

  resources :sessions, only: [:new, :create]
  delete  'log_out' => 'sessions#destroy'
end
