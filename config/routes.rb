# frozen_string_literal: true

Rails.application.routes.draw do
  # Admin management
  require "sidekiq/web"
  authenticate :admin do
    mount Sidekiq::Web => '/sidekiq'
  end
  namespace 'administration' do
    resources :items, :orders, :admins, :users
  end
  # Base
  devise_for :admins
  devise_for :users
  authenticated :admin do
    root 'administration/items#index', as: :admin_root
  end
  root to: 'items#index'
  get 'contact', to: 'static_pages#contact'
  get 'about', to: 'static_pages#about'
  # Shop
  resources :charges, only: %i[new create]
  resources :items, only: %i[index show]
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
