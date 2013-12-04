SCCProxy::Application.routes.draw do
  # API
  mount API::Base => '/'
end
