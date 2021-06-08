Rails.application.routes.draw do
  # resources :makeups do
  #   resources :makeup_bags
  #   resources :bags, only: [:new, :create, :edit, :update, :destroy]
  # end
  
  #'/bags/:bag_id/makeup_bags/new'
  resources :bags, only: [:new, :create] do
    resources :makeup_bags
    resources :makeup
  end

  resources :makeup_bags


  resources :users, only: [:index, :new, :create, :show] do
    resources :bags 
    resources :makeup_bags
  end
  
  
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/auth/google_oauth2/callback', to: 'sessions#google_signin'
  
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  get 'password/:id/edit', to: 'user#password_edit', as: 'edit_password'
  patch 'password/:id', to: 'users#password_update', as: 'password'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #root 'application#home'

  # get 'makeups', to: 'application#makeups'
  # get 'bags', to: 'application#bags'
  # get 'makeup_bags', to: 'application#makeup_bags'

end
