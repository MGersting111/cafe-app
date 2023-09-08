Rails.application.routes.draw do
  resources :artikelkategories do
    resources :artikels
    get "add/:id", to:"artikels#add", as: "artikels_add"
  end
  resources :artikels, only: %i[new create]

  root 'artikelkategories#index'
  resources :bestellungs
  resources :bestellung_artikels
  resources :warenkorbs

end
