Rails.application.routes.draw do
  get 'search', to: "search#index"
  # Welcome for all users
  root :to => "pages#home"

  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"  
  
  resources :users, :except => [:index]
  resources :channels, :only => [:index, :show]
  post "/channels/:id/join" => "channels#join", as: "join_channel"
  post "/channels/:id/leave" => "channels#leave", as: "leave_channel"
  resources :posts, :except => [:index]
  resources :comments, :only=> [:new, :create]
  post "/comments/:id/delete" =>  "comments#delete", as: "remove_comment" 
end
