Rails.application.routes.draw do
  devise_for :users
  resources :cities
  root 'cities#index'
end
