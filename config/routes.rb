# frozen_string_literal: true

Rails.application.routes.draw do
  # Admin management
  require "sidekiq/web"
  authenticate :admin do
    mount Sidekiq::Web => '/sidekiq'
  end
  namespace 'administration' do
    get 'admin', to: 'items#index'
    resources :items
    resources :orders
  end

  # Base
  devise_for :admins
  devise_for :users
  root to: 'items#index'

  get 'contact', to: 'static_pages#contact'
  get 'about', to: 'static_pages#about'

  # Shop
  resources :charges
  resources :items, only: %i[index show]
  resource :basket, only: [:show]
  resources :order_items, only: %i[create update destroy]
end
