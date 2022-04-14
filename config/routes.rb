Rails.application.routes.draw do
  get 'channels/index/:page', to: "channels#index"
  root :to => "pages#home"
  resources :users, :except =>[:destroy] 
  resources :posts, :only => [:new, :create, :show]
  resources :channels, :only => [:index, :show]
  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  
end
