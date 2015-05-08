Rails.application.routes.draw do
  root 'users#new'
  resources :users, except: [:edit, :update, :destroy]
end
