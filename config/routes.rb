Rails.application.routes.draw do
  require 'sidekiq/web'
  resources :parts
  resources :asset_tags
  resources :locations
  resources :orders
  devise_for :users
  resources :consumables
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'dashboard#index'

mount Sidekiq::Web, at: '/sidekiq'

end
