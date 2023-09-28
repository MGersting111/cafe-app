# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :orders
  resources :line_items, only: %i[create update delete destroy]

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
    resources :tables do
      member do
        get 'qr_code'
      end
    end
    resources :categories do
      resources :articles
    end
    resources :articles, only: %i[new create]

    root 'dashboards#show'
  end

  root 'management/categories#index'
end
