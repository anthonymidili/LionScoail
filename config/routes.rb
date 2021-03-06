Rails.application.routes.draw do
  devise_for :users
  root 'sites#home'
  # All get
  get :admin, to: "admins#usersettings"
  # All the resources
  resources :posts
  resources :abouts
  resources :errors
  resources :relationships, only: [:create, :destroy]
  resources :articles
  resources :badusers
  resources :acindents
  resources :suggestions
  resources :helps
  # All resources with do and end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    resources :comments
  end
  # resources :articles do
  #   resources :feedbacks
  # end
  resources :rooms do
    resources :room_messages
  end
  resources :conversations, only: [:index, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
