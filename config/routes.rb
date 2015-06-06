Rails.application.routes.draw do
  root 'users#new'

  devise_for :admins

  authenticate :admin do
    resources :users, except: [:create, :edit, :destroy] do
      resources :votes, only: [:create]
    end
    get '/events', to: 'events#index', as: 'events'
  end

  resources :users, only: [:create]
  get '/users/:id/user-status/:status', to: 'users#update_user_status', as: 'user_status'

end
