Rails.application.routes.draw do
<<<<<<< HEAD
  resources :artikelkategories do
    resources :artikels
  end
  resources :artikels, only: %i[new create]

  root 'artikelkategories#index'
=======
  resources :artikelkategories
  resources :artikels
  resources :bestellungs
  resources :bestellung_artikels
  resources :warenkorbs




>>>>>>> main
end
