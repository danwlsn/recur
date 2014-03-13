Fitness::Application.routes.draw do

	root 'users#index'

	get '/about', to: 'static#about'
	get '/contact', to: 'static#contact'

	resources :users do
		member do
			get :weight
			get :log
			get :goals
			get :admin
		end
	end
	get '/signup', to: 'users#new'

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

	resources :sessions, only: [:new, :create, :destroy]
	get '/signin', to: 'sessions#new'
	delete '/signout', to: 'sessions#destroy'

end
