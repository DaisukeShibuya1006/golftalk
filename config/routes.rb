# frozen_string_literal: true

Rails.application.routes.draw do
  resources :blogs do
    resources :comments, only: [:create, :destroy]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  get '/', to: 'users#index'
  # get 'show', to: 'users#show'
  get '/users/:id', to: 'users#show', as: :user
  get 'list', to: 'users#list'

  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  post 'posts/complete' => 'posts#create'

  resources :relationships, only: [:create, :destroy]

  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
end
