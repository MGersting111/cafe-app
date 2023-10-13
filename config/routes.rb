# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :management do
    resources :companies
    resource :dashboard, only: [:show]
    resource :errors, only: [:create]

    root 'dashboards#show'
  end

  namespace :administration do
    resource :dashboard, only: [:show]
    resources :tables do
      member do
        get 'qr_code'
      end
    end
    resources :categories do
      resources :articles
    end

    resources :orders
    post 'order_payed/:id', to: 'orders#order_payed', as: :order_payed
    post 'order_served/:id', to: 'orders#order_served', as: :order_served
    get 'served', to: 'orders#orders_served'
    get 'payed', to: 'orders#orders_payed'

    root 'dashboards#show'
  end

  namespace :shop do
    resources :categories, only: %i[index] do
      resources :articles, only: %i[index show]
    end
    resources :orders
    resources :line_items, only: %i[create update delete destroy]

    get 'basket', to: 'orders#current_order'
    post 'basket', to: 'orders#order_complete'

    root 'categories#index'
  end

  get 'select_companies', to: 'companies#select_company'

  root 'companies#shop'
end
