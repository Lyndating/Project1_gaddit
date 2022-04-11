Rails.application.routes.draw do
  get 'channels/index'
  root :to => "pages#home"
  resources :users, :only =>[:new, :index, :create, :show] 
  resources :posts, :only => [:new, :create, :show]
  resources :channels, :only => [:index]
  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"
end
