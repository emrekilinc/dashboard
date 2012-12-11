Dashboard::Application.routes.draw do
  match 'about', :to => 'home#about'
  root :to => 'home#index'
end
