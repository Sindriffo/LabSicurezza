Rails.application.routes.draw do
  devise_for :admins
  get 'omniauth/Callbacks'

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	root :to => 'pages#home'
	# root :to => 'travels#find'
      
	resources :faqs
	resources :reviews
	resources :contattacis
	resources :infos
	resources :segnalatis
	resources :low_ratings
	resources :finds
	resources :travels
	resources :joinedtravels
	
	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	
	devise_scope :user do 
		get '/users/sign_out' => 'devise/sessions#destroy'
	end


	resources :users

end
