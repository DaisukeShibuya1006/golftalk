Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/' , to: 'users#index'
  get 'show', to: 'users#show'
end
