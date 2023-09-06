Rails.application.routes.draw do
  get "add/:id", to:"artikels#add", as: "artikels_add"
  resources :artikelkategories
  resources :artikels
  resources :bestellungs
  resources :bestellung_artikels
  resources :warenkorbs




end
