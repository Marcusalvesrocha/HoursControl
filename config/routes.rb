Rails.application.routes.draw do
  
  resources :employees
  #resources :time_pointing, only: [:index, :new, :create, :destroy]

  get 'time_pointing/index'
  get 'time_pointing/register'
  
  get 'home/about'
  root to: 'home#index'
  
  devise_for :users
  #mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
