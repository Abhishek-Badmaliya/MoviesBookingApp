Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :movies
  resources :theaters
  resources :shows do
    resources :bookings
  end
  post "checkout/create", to: "checkout#create"

  get "success", to: "checkout#success"
  get "failure", to: "checkout#failure"

  root "pages#home"
  get '/pages', to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
