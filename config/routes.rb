# frozen_string_literal: true

Rails.application.routes.draw do
  resources :meetings
  resources :users
  resources :sessions, only: [:new,:create,:destory]
  get 'home/index'
  root 'home#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  post 'feedback', to: 'feedback#create', as: 'feedback'

  # get 'stripe/index', to: 'stripe#index'
  get 'checkout', to: 'stripe#index', as: :stripe_connect

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :services do
    resources :professionals
  end
end
