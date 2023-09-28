# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :articles
  end
  get 'categories/:id/articles', to: 'articles#add', as: 'add'
  resources :articles, only: %i[new create]
  resources :orders
  resources :line_items, only: %i[create update delete destroy]
  resources :tables

  get 'basket', to: 'orders#current_order'
  post 'basket', to: 'orders#order_complete'
  post 'order_payed/:id', to: 'orders#order_payed', as: :order_payed
  post 'order_served/:id', to: 'orders#order_served', as: :order_served
  get 'served', to: 'orders#orders_served'
  get 'payed', to: 'orders#orders_payed'

  # this introduces a fragement in the routes called /management and routes all
  # requests to namespaces controllers.
  namespace :management do
    resource :dashboard, only: [:show]
    root 'dashboards#show'
  end

  root 'categories#index'
end
