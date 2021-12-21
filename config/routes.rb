Rails.application.routes.draw do
  resources :users do
    resources :listings
  end
  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', as: :logout
  get 'welcome', to: 'welcome#index'
  root to: "home#index"
end
