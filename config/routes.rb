Rails.application.routes.draw do
  resources :artikelkategories do
    resources :artikels
  end
  resources :artikels, only: %i[new create]

  root 'artikelkategories#index'
end
