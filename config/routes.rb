Rails.application.routes.draw do
  resources :tables
  resources :line_items
  resources :orders
  resources :artikelkategories do
    resources :artikels
  end
  resources :artikels, only: %i[new create]

  root 'artikelkategories#index'
 
end
