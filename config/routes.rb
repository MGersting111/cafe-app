Rails.application.routes.draw do
  resources :artikelkategories do
    resources :artikels
  end
  resources :artikels, only: %i[new create]

  root 'artikelkategories#index'
  get "add/:id", to:"artikels#add", as: "artikels_add"
  resources :bestellungs
  resources :bestellung_artikels
  resources :warenkorbs

end
