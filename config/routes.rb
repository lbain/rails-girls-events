Rails.application.routes.draw do
  root 'users#new'
  resources :users, except: [:edit, :update, :destroy]

  get '/users/:id/:status', to: 'users#status', as: 'status'

end
