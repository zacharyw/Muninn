Muninn::Application.routes.draw do
  root :to => "posts#index"
  
  resources :posts do
	  resources :comments, :only => [:create, :destroy]
	end
	
	match "setup" => "users#new"
	match "about" => "users#show", :id => 1, :as => :about
	
	resources :users, :only => [:create]
	
	resources :user_sessions
	match 'admin' => "user_sessions#new",      :as => :admin
	match 'logout' => "user_sessions#destroy", :as => :logout
end
