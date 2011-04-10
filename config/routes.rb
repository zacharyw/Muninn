Muninn::Application.routes.draw do
  root :to => "posts#index"
  
  resources :posts do
  	if User.table_exists? && !User.first.blank? && User.first.enable_comments
	  	resources :comments, :only => [:create, :destroy, :new]
  	end
	end
	
	match "setup" => "users#new"
	match "properties" => "users#edit", :id => 1, :as => :properties
	match "about" => "users#show", :id => 1, :as => :about
	match 'sitemap', :to => 'sitemap#index', :via => [:get]
	
	resources :users, :only => [:create, :edit, :update]
	
	resources :user_sessions
	match 'admin' => "user_sessions#new",      :as => :admin
	match 'logout' => "user_sessions#destroy", :as => :logout
end
