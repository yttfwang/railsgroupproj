Rails.application.routes.draw do
	authenticated do
		root :to => 'users#index', as: :authenticated
	end
  	root to: 'visitors#index'
  	devise_for :users
  	resources :users do
  		resource :status
  		#delete if want to work
  	end
end