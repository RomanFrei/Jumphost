Jumphost::Application.routes.draw do
  resources :appointments, shallow: true do 
         resources :comments
	 resources :members
  end
	 match 'delete_member' => 'members#destroy', :as => :delete_member
	 match 'destroy_appointment' => 'appointments#destroy', :as => :destroy_appointment
	 match 'destroy_all_appointments' => 'appointments#destroy_all', :as => :destroy_all_appointments
	 match 'create_dummies' => 'appointments#create_dummies', :as => :create_dummies
  resources :users, :user_sessions
	resources :friends
	 match 'accept_friendship' => 'friends#accept_friendship', :as => :accept_friendship
	resources :groups
	 match 'add_friend' => 'friends#add', :as => :add_friend
	 match 'login' => 'user_sessions#new', :as => :login
  	 match 'logout' => 'user_sessions#destroy', :as => :logout
  resources :home
  resources :shares
	match 'participate' => 'shares#create', :as => :participate
	match 'checkout' => 'shares#destroy', :as => :checkout
  root :to =>  'home#index'
end
