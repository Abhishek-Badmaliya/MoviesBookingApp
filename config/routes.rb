Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :theaters
  resources :movies do
    resources :shows do
      resources :bookings
    end
  end
  post "checkout/create", to: "checkout#create"

  get "search_queries", to: "movies#search_queries"

  get "success", to: "checkout#success"
  get "failure", to: "checkout#failure"

  root "pages#home"
  get '/pages', to: "pages#home"

  #add routes for show user's profile
  # resources :users, only: [:show]
  get 'profiles', to: "profiles#show"
end
