Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :images, only: [:create, :destroy]

  get "/publicImages", to: "images#public"
  
  post "/register", to: "auth#register"
  post "/login", to: "auth#login"
  get "/profile", to: "users#profile"

  post "createdev", to: "images#createdev"


end
