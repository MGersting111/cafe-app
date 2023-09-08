Rails.application.routes.draw do
  resources :categories do
    resources :articles
  end
  
  resources :articles, only: %i[new create]
  resources :orders
  resources :line_items
  resources :tables
  root 'categories#index'
end
