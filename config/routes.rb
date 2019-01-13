Rails.application.routes.draw do
  resources :asset_tags
  resources :locations
  resources :orders
  devise_for :users
  resources :consumables
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'dashboard#index'


end
