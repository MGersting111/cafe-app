Rails.application.routes.draw do
  resources :categories do
    resources :articles
  end
  resources :articles, only: %i[new create]

  root 'categories#index'
end
