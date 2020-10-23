Rails.application.routes.draw do
  resources :item_tags
  resources :fixed_assets

#sidekiq web interface
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
  get '/asset_tags/:id/print_tag_large' => 'asset_tags#print_tag_large', as: 'print_tag_large'
  get '/asset_tags/:id/print_tag_med' => 'asset_tags#print_tag_med', as: 'print_tag_med'


  #print routes from consumables view
  get 'consumables/:id/print_med' => 'consumables#print_tag_med', as: 'consumable_print_med'
  get 'consumables/:id/print_large' => 'consumables#print_tag_large', as: 'consumable_print_large'


  get 'fixed_asset/:id/disposal' => 'fixed_assets#disposal', as: 'disposed_fixed_asset'
root to: 'dashboard#index'

mount Sidekiq::Web, at: '/sidekiq'

get 'search/index'
post 'search/query'

#for qr code lookup allows you to type example.com/TAG_NUMBER
get ':tag', to: 'asset_tags#taglookup'

#obsolete consumables path
get 'obsolete/consumables', to: 'consumables#obsolete'

#disposed assets path
get 'disposed/assets', to: 'fixed_assets#disposed'

get 'consumables/:id/incoming', to: 'consumables#incoming', as: 'incoming_consumable'
post 'consumables/:id/incoming', to: 'consumables#item_tag_maker', as: 'incoming_consumable_maker'
end
