Rails.application.routes.draw do
  root                   'static_pages#home'
  get    '/about',   to: 'static_pages#about'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
      get :feed
    end
  end
  resources :wines,         only: [:new, :create, :edit, :update, :destroy]
  resources :relationships, only: [:create, :destroy]
end
