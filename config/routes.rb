Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"
  get "/stores", to: "stores#index"
  get "/stores/new", to: "stores#new"
  post "/stores", to: "stores#create"
  get "/stores/:id", to: "stores#show"
  get "/stores/:id/edit", to: "stores#edit"
  patch "/stores/:id", to: "stores#update"
  delete "/stores/:id", to: "stores#destroy"

  get "/teams", to: "teams#index"
  get "/teams/new", to: "teams#new"
  post "/teams", to: "teams#create"
  get "/teams/:id", to: "teams#show"
  get "/teams/:id/edit", to: "teams#edit"
  patch "/teams/:id", to: "teams#update"
  delete "/teams/:id", to: "teams#destroy"

  get "/players", to: "players#index"
  get "/players/new", to: "players#new"
  post "/players", to: "players#create"
  get "/players/:id", to: "players#show"
  get "/players/:id/edit", to: "players#edit"
  patch "/players/:id", to: "players#update"
  delete "/players/:id", to: "players#destroy"
end
