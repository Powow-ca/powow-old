# frozen_string_literal: true

Rails.application.routes.draw do
  resources :meetings
  resources :users
  resources :sessions, only: %i[new create destory]
  resources :products, only: %i[new create]
  get 'home/index'
  root 'home#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'about', to: 'aboutus#index'

  get 'pro', to: 'users#pro' 
  post 'feedback', to: 'feedback#create', as: 'feedback'

  get 'success', to: 'stripe#order_success'
  get 'stripe-account', to: 'stripe#create_account'
  # get 'stripe/index', to: 'stripe#index'
  get 'checkout', to: 'stripe#initiate_payment', as: :stripe_connect

  get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :services do
    resources :professionals
  end
end
