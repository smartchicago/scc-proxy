SCCProxy::Application.routes.draw do 
  # API
  mount API::Base => '/'

  # Redirect the root back to SCC
  root :to => redirect("http://www.smartchicagocollaborative.org/")

  # New Relic
  mount NewRelicPing::Engine => '/status'

  # Active Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
