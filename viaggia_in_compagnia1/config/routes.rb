Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	resources :admin, :only => [:index, :show]
	
	resources :users do
		resources :joinedtravels
	end		
	
	resources :travels

	get '/' => 'sessions#default_path'
	get '/callback' => 'sessions#create'
	get '/login' => 'sessions#login'
	get '/logout' => 'sessions#logout'

end
