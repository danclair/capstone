Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  get "/events" => "events#index"
  get "/events/new" => "events#new"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/events" => "events#index"
    post "/events" => "events#create"
    get "/events/:id" => "events#show"
    patch "/events/:id" => "events#update"
    delete "/events/:id" => "events#destroy"

    get "/users" => "users#index"
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get "/vehicles" => "vehicles#index"
    post "/vehicles" => "vehicles#create"
    get "/vehicles/:id" => "vehicles#show"
    patch "/vehicles/:id" => "vehicles#update"
    delete "/vehicles/:id" => "vehicles#destroy"

    get "/comments" => "comments#index"
    post "/comments" => "comments#create"
    get "/comments/:id" => "comments#show"
    patch "/comments/:id" => "comments#update"
    delete "/comments/:id" => "comments#destroy"

    get "/event_users" => "event_users#index"
    post "/event_users" => "event_users#create"
    delete "/event_users/:id" => "event_users#destroy"
  end
end
