Rails.application.routes.draw do
  get "about", to: "about#index", as: :about

  root to: "pages#index"

  #get "account", to: "billing_account#index"
  #get "account/pay", to: "billing_account#pay"
  #post "account/pay", to: "billing_account#update"

  get "register", to: "registrations#new"
  post "register", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  get "logout", to: "sessions#destroy"

  get "user_profile", to: "user_profiles#edit"
  patch "user_profile", to: "user_profiles#update"
  post "user_profile/switch", to: "sessions#switch"

  # Password resets
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  #mount Pay::Engine, at: "/pay"

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_error", via: :all
end
