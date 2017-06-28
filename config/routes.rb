Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show]
  resources :cities do
  resources :posts
    patch :create
    put :create
end
  root 'cities#index'
end
