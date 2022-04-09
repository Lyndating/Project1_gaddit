Rails.application.routes.draw do

  root :to => "pages#home"
  resources :users, :only =>[:new, :index, :create, :show] 

  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"
end
