Rails.application.routes.draw do
  root                   'static_pages#home'
  get    '/about',   to: 'static_pages#about'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get '/auth/facebook/callback', to: 'sessions#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
      get :feed
    end
  end
  resources :wines, only: [:new, :create, :edit, :update, :destroy]
  resources :wines do
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]
  resources :comments do
    resources :comments
  end
end
