Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/posts" => "posts#index"

  post "/posts" => "posts#create"
end
