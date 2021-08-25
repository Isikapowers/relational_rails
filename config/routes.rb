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

  get "/books", to: "books#index"
  get "/books/new", to: "books#new"
  post "/books", to: "books#create"
  get "/books/:book_id", to: "books#show"
  get "/books/:book_id/edit", to: "books#edit"
  patch "/books/:book_id", to: "books#update"
  delete "/books/:book_id", to: "books#destroy"

  get "/stores/:store_id/books", to: "store_books#index"
  get "/stores/:store_id/books/new", to: "store_books#new"
  post "/stores/:store_id/books", to: "store_books#create"
  get "/stores/:store_id/books/:book_id", to: "store_books#show"
  get "/stores/:store_id/books/:book_id/edit", to: "store_books#edit"
  patch "/stores/:store_id/books/:book_id", to: "store_books#update"
  delete "/stores/:store_id/books/:book_id", to: "store_books#destroy"

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
