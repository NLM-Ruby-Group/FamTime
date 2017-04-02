Rails.application.routes.draw do
  
  resources :events do
    resources :comments
    collection do
      get :show_mine
    end
  end
  resources :places do
    resources :reviews
  end
  root 'home#index'

  resources :users do
    member do
      get :confirm_email 
    end
  end
  resources :registrations
  resources :sessions, only: [:new, :create]
  delete  'log_out' => 'sessions#destroy'

  
end
