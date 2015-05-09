Rails.application.routes.draw do
  root 'users#new'
  resources :users, except: [:edit, :update, :destroy]
  get '/users/:id/user-status/:status', to: 'users#status', as: 'status'
  get '/users/:user_id/vote/:vote_type', to: 'votes#create', as: 'vote'
end
