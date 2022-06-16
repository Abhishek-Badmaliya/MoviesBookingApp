Rails.application.routes.draw do
  resources :movies
  resources :theaters
  resources :screens

  root "pages#home"
  get '/pages', to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
