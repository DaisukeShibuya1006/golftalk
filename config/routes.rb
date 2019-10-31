# frozen_string_literal: true

Rails.application.routes.draw do
  resources :blogs do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

  get '/', to: 'users#index'

  get '/users/:id', to: 'users#show', as: :user
  get 'list', to: 'users#list'

  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  post 'posts/complete' => 'posts#create'

  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
end
