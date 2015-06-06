Rails.application.routes.draw do
  root 'users#new'

  resources :users, except: [:edit, :destroy] do
    resources :votes, only: [:create]
  end

  get '/events', to: 'events#index', as: 'events'

  # Left separate from update since it's not for admin
  get '/users/:id/user-status/:status', to: 'users#update_user_status', as: 'user_status'

end
