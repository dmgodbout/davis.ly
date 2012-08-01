DavisLy::Application.routes.draw do

	

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "users#new"
  resources :users
  resources :sessions


  resources :links
  match ':in_url' => 'links#go'
  
  root to: 'links#show'

end
