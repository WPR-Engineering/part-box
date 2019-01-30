Rails.application.routes.draw do
  resources :fixed_assets
  require 'sidekiq/web'
  resources :parts
  resources :asset_tags
  resources :locations
  resources :orders
  devise_for :users
  resources :consumables
  resources :line_items

  #printing routes
  get '/asset_tags/:id/print_tag' => 'asset_tags#print_tag', as: 'print_tag'
  get '/asset_tags/:id/print_tag_small' => 'asset_tags#print_tag_small', as: 'print_tag_small'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'dashboard#index'

mount Sidekiq::Web, at: '/sidekiq'

get 'search/index'
post 'search/query'

get ':tag', to: 'asset_tags#taglookup'
end
