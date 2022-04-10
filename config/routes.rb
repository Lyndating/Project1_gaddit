Rails.application.routes.draw do

  get 'post/new'
  get 'post/show'
  get 'post/edit'
  root :to => "pages#home"
  resources :users, :only =>[:new, :index, :create, :show] 
  resources :posts, :only => [:new, :create, :show]
  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"
end
