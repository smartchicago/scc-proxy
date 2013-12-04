SCCProxy::Application.routes.draw do
  # Redirect the root back to SCC
  root :to => redirect("http://www.smartchicagocollaborative.org/")

  # Active Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # API
  mount API::Base => '/'
end
