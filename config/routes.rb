Rails.application.routes.draw do
  root 'sessions#index'
  get 'login' => 'sessions#new', as: 'login'  
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'signup' => 'users#new', as: 'signup'

  resources :sessions, only: [:create]
  resources :users, only: [:create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
