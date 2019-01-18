Rails.application.routes.draw do
  resources :fixed_assets
  require 'sidekiq/web'
  resources :parts
  resources :asset_tags
  get '/asset_tags/:id/print_tag' => 'asset_tags#print_tag', as: 'print_tag'
  resources :locations
  resources :orders
  devise_for :users
  resources :consumables
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'dashboard#index'

mount Sidekiq::Web, at: '/sidekiq'

end
