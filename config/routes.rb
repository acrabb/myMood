MyMood::Application.routes.draw do
  get "user/index"

  get '/', to: 'homepage#index', as: 'home'
  match '/admin/index', :controller => 'admin', :action => 'index'
  resources :admin, :users
	resources :sessions, only: [:new, :create, :destroy]
	#root 'admin_controller#index'
	match '/signup', to: 'users#new',	via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
	match '/signout', to: 'sessions#destroy', via: 'delete'


end
