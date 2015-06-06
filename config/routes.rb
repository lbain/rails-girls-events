Rails.application.routes.draw do

  root 'users#new'
  resources :users, except: [:index, :edit, :update, :destroy]
  devise_for :admins

  get "sign_in", to: "devise/sessions#new"

  authenticate :admin do
    get 'users', to: 'users#index'
    get '/users/:id/user-status/:status', to: 'users#update_user_status', as: 'user_status'
    get '/users/:id/admin-status/:status', to: 'users#update_admin_status', as: 'admin_status'

    get '/users/:user_id/vote/:vote_type', to: 'votes#create', as: 'vote'

    get '/events', to: 'events#index', as: 'events'
  end

end
