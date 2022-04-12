Rails.application.routes.draw do
  get 'channels/index/:page', to: "channels#index"
  root :to => "pages#home"
  resources :users, :only =>[:new, :index, :create, :edit] 
  resources :posts, :only => [:new, :create, :show]
  resources :channels, :only => [:index, :show]
  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"
  get "/user-homepage" => "users#show"

end
