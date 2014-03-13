Fitness::Application.routes.draw do

	# Root path
	root 'users#index'

	# Static routes
	get '/about', to: 'static#about'
	get '/contact', to: 'static#contact'

	# Users resources
	resources :users do
		member do
			get :weight # Weight view
			get :log # Log view
			get :goals # Goal view
			get :admin # Admin view
		end
	end

	# Signup route
	get '/signup', to: 'users#new'
	# Signin route
	get '/signin', to: 'sessions#new'
	# Signout route
	delete '/signout', to: 'sessions#destroy'
	resources :sessions, only: [:new, :create, :destroy]

	# Route for creating user things
	resources :current_weights, only: [:create, :destroy]
	resources :goal_weights, only: [:create, :destroy]
	resources :fitness_logs, only: [:create, :destroy]
	resources :option, only: [:create, :update, :destroy]
	resources :goals, only: [:create, :update, :destroy]

	resources :goals do
		member do
			get :complete, :via => :post
		end
	end

end
