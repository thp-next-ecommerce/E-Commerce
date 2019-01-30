# frozen_string_literal: true

Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :admin do
    mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :admins
  devise_for :users
  root to: 'items#index'
  get 'contact', to: 'static_pages#contact'
  get 'about', to: 'static_pages#about'
  resources :charges
  resources :items, only: %i[index show]

  namespace 'administration' do
    get 'admin', to: 'items#index'
    resources :items
    resources :orders
  end
end
