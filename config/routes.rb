Muninn::Application.routes.draw do
  root :to => "posts#index"
  
  resources :posts do
	  resources :comments, :only => [:create]
	end
	
	match "setup" => "users#new"
	
	resources :users, :only => [:create]
end
