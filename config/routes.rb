Rails.application.routes.draw do
  devise_for :users
  get '/' , to: 'users#index'
  get 'show', to: 'users#show'
end
