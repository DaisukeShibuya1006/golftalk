Rails.application.routes.draw do
  resources :blogs
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks',registrations: 'registrations'}
  get '/' , to: 'users#index'
  get 'show', to: 'users#show'

  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  post 'posts/complete' => 'posts#create'

  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
end
