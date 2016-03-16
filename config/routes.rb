Rails.application.routes.draw do
  root 'users#new'

  devise_for :admins

  authenticate :admin do
    resources :users, except: [:create, :edit]
    resources :events do
      get '/data', to: 'events#data'
    end
    resources :applications do
      resources :votes, only: [:create]
    end
  end

  resources :users, only: [:create, :edit]
  get '/applications/:id/user-status/:status', to: 'applications#update_user_status', as: 'application_status'

end
