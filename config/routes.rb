Rails.application.routes.draw do
  root                                 'static_pages#home'
  get    '/signup',                to: 'users#new'
  post   '/signup',                to: 'users#create'
  get    '/auth/twitter/callback', to: 'sessions#create'
  get    '/login',                 to: 'sessions#new'
  post   '/login',                 to: 'sessions#create'
  delete '/logout',                to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
      get :feed
    end
  end
  resources :wines do
    resources :comments, only: [:new, :create]
  end
  resources :relationships, only: [:create, :destroy]
end
