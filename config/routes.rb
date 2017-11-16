Rails.application.routes.draw do



root to: 'products#index'


devise_for :users
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :products


end
