Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :posts
  end
  resources :comments

  get "/" => "users#home"
  get "/home" => "users#home"
  get "/signin" => "users#signin"
  get "/signin" => "users#signin"
  get "/signout" => "users#signout"

end
