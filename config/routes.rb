Rails.application.routes.draw do
  get 'channels/index/:page', to: "channels#index"
  root :to => "pages#home"
  resources :users, :except =>[:destroy] 
  resources :posts, :except => [:index]
  resources :channels, :only => [:index, :show]
  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"  
end
