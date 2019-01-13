Rails.application.routes.draw do
  resources :orders
  devise_for :users
  resources :consumables
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'dashboard#index'


end
