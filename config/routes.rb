Rails.application.routes.draw do
  resources :comments
  resources :events do
    collection do
      get :show_mine
    end
  end
  resources :places
  root 'home#index'

  resources :users

  resources :sessions, only: [:new, :create]
  delete  'log_out' => 'sessions#destroy'

  
end
