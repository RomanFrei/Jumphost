Jumphost::Application.routes.draw do
  resources :appointments do 
         resources :comments
  end
 	 match 'date' => 'appointments#index', :as => :date
	 match 'destroy_appointment' => 'appointments#destroy', :as => :destroy_appointment
  resources :users, :user_sessions
	 match 'login' => 'user_sessions#new', :as => :login
  	 match 'logout' => 'user_sessions#destroy', :as => :logout
  resources :home
  resources :shares
	match 'participate' => 'shares#create', :as => :participate
	match 'checkout' => 'shares#destroy', :as => :checkout
  root :to =>  'home#index'
end
