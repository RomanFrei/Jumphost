Jumphost::Application.routes.draw do
  resources :appointments
  match 'date' => 'appointments#index', :as => :date
  resources :users, :user_sessions
  resources :home
  resources :shares
  match 'participate' => 'shares#create', :as => :participate
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  root :to =>  'users#index'
end
