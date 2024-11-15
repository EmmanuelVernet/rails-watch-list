Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"

  resources :lists do
    resources :bookmarks, only: [:edit, :index, :show, :new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
