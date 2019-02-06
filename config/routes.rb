# frozen_string_literal: true

Rails.application.routes.draw do
  # Base
  devise_for :admins
  devise_for :users
  root to: 'items#index'

  # Admin management
  require "sidekiq/web"
  namespace 'administration' do
    resources :items, :orders, :admins, :users
  end
  authenticate :admin do mount Sidekiq::Web => '/sidekiq' end
  authenticated :admin do
    root 'administration/items#index', as: :admin_root
  end

  # Shop
  resources :charges, only: %i[new create]
  resources :items, only: %i[index show] do
    get ':page', action: :index, on: :collection
  end
  resource :basket, only: [:show]
  resources :orders, only: %i[index show]
  get '/orders/:id/close', to: 'orders#close', as: 'close_order'
  post '/orders/:id/close', to: 'orders#close'
  resources :order_items, only: %i[create update destroy]

  # User order
  resources :users, only: %i[show] do
    resources :orders, only: %i[index show]
  end
end
