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

  root 'categories#index'
end
