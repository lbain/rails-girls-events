Rails.application.routes.draw do
  root 'users#new'

  devise_for :admins

  authenticate :admin do
    resources :users, except: [:create, :edit]
    resources :events
    resources :applications do
      resources :votes, only: [:create]
    end
    get '/data', to: 'users#data', as: 'data'
  end

  resources :users, only: [:create, :edit]
  get '/applications/:id/user-status/:status', to: 'applications#update_user_status', as: 'application_status'

end
