Rails.application.routes.draw do
  devise_for :users
  resources :movies
  resources :theaters
  resources :shows
  resources :bookings

  root "pages#home"
  get '/pages', to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
