Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :articles
  end
  get 'categories/:id/articles', to: 'articles#add', as: 'add'
  resources :articles, only: %i[new create]
  resources :orders
  resources :line_items, only: [:create, :update, :delete, :destroy]
  resources :tables

  get 'basket', to: 'orders#current_order'
  post 'basket', to: 'orders#order_complete'
  post 'order_payed/:id', to: 'orders#order_payed', as: :order_payed
  post 'order_served/:id', to: 'orders#order_served', as: :order_served
  get 'served', to: 'orders#orders_served'
  get 'payed', to: 'orders#orders_payed'

  #Tables
  get 'table/1', to: 'categories#index'

  root 'categories#index'
end
