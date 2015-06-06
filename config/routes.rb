Rails.application.routes.draw do
  root 'users#new'

  resources :users, except: [:edit, :destroy] do
    resources :votes, only: [:create]
  end

  get '/users/:id/user-status/:status', to: 'users#update_user_status', as: 'user_status'
  get '/users/:id/admin-status/:status', to: 'users#update_admin_status', as: 'admin_status'

  get '/events', to: 'events#index', as: 'events'


end
