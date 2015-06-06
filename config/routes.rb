Rails.application.routes.draw do
  root 'users#new'

  resources :users, except: [:edit, :update, :destroy]
  get '/users/:id/user-status/:status', to: 'users#update_user_status', as: 'user_status'
  get '/users/:id/admin-status/:status', to: 'users#update_admin_status', as: 'admin_status'

  get '/users/:user_id/vote/:vote_type', to: 'votes#create', as: 'vote'

  get '/events', to: 'events#index', as: 'events'

  patch '/users/:id', to: 'users#create_user_comment', as: 'comments'

end
