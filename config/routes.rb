Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:index, :show]
  root "users#index"
  resources :messages, :only => [:create]
  resources :prices, :only => [:create, :index]
  resources :rooms, :only => [:create, :show, :index]
end
