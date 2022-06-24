Rails.application.routes.draw do
  devise_for :users
  get 'likes/new'
  get 'comments/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :new, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end

  namespace :api do
    resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new,:create,:show,:destroy] do
      resources :comments, only: [:index, :new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end    
 end
  root 'users#index'
end
