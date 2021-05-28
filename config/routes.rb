Rails.application.routes.draw do
  root 'sessions#index'
  get 'login' => 'sessions#new', as: 'login'  
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'signup' => 'users#new', as: 'signup'
  get 'externals' => 'charities#external', as: 'externals'
  post 'create_charity' => 'charities#create', as: 'create_charity'
  patch 'update_charity' => 'charities#update', as: 'update_charity'

  resources :sessions, only: [:create]
  resources :users, only: [:create, :show]
  resources :charities
  resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
