Rails.application.routes.draw do
  get 'users/index'
  get 'show', to: 'users#show'
end
