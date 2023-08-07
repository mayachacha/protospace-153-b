Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
<<<<<<< HEAD
  resources :prototypes do
    resources :comments
=======

  resources :prototypes do
    resources :comments, only: :create
>>>>>>> 054ce1582a744c09f4fec172999db371f87a47e7
  end
end
