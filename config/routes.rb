Rails.application.routes.draw do
  get 'channels/index/:page', to: "channels#index"
  root :to => "pages#home"
  resources :users, :except =>[:destroy, :show] 
  resources :posts, :except => [:index]
  resources :channels, :only => [:index, :show]
  post "/channels/:id/join" => "channels#join", as: "join_channel"
  post "/channels/:id/leave" => "channels#leave", as: "leave_channel"
  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"  
  resources :comments, :only=> [:new, :create]
  post "/comments/:id/delete" =>  "comments#delete", as: "remove_comment"
  
end
