Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root :to => 'pages#home'

	resources :travels
	resources :joinedtravels
	
	devise_scope :user do 
		get '/users/sign_out' => 'devise/sessions#destroy'
	end

	resources :users, only: [:show]

end