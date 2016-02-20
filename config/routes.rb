Rails.application.routes.draw do
  root 'users#new'

  devise_for :admins

  authenticate :admin do
    resources :users, except: [:create, :edit] do
      resources :votes, only: [:create]
    end
    resources :events
    get '/data', to: 'users#data', as: 'data'
  end

  resources :users, only: [:create, :edit]
  get '/users/:id/user-status/:status', to: 'users#update_user_status', as: 'user_status'

end
