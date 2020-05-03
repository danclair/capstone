Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  get "/events" => "events#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/events" => "events#index"
    post "/events" => "events#create"
    get "/events/:id" => "events#show"
    patch "/events/:id" => "events#update"
    delete "/events/:id" => "events#destroy"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get "/vehicles" => "vehicles#index"
    post "/vehicles" => "vehicles#create"
    get "/vehicles/:id" => "vehicles#show"
    patch "/vehicles/:id" => "vehicles#update"
    delete "/vehicles/:id" => "vehicles#destroy"

    get "/"
  end
end
