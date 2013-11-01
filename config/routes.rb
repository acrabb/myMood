MyMood::Application.routes.draw do
  get "user/index"

  match '/admin/index', :controller => 'admin', :action => 'index'
  resources :admin
end
