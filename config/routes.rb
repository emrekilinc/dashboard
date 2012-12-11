Dashboard::Application.routes.draw do
  # ProjectController routes
  match 'project/create', :to => 'project#create', :via => :post
  match 'project/detail/:project_code', :to => 'project#detail', :via => :get

  # HomeController routes
  match 'about', :to => 'home#about'
  root :to => 'home#index'
end
