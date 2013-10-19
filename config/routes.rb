MyMood::Application.routes.draw do
  match '/admin/index', :controller => 'admin', :action => 'index'
  resources :admin
end
