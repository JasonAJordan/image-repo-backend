Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users#, only: [:show]
  resources :images#, only: [:show]

  get "/publicImages", to: "images#public"
  
  # get "/autologin", fo: "user#autologin"
  post "/register", to: "auth#register"
  post "/login", to: "auth#login"
  get "/profile", to: "users#profile"


end
