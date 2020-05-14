Rails.application.routes.draw do
  
  
  devise_for :users
  root 'page#home'
  # root 'items#index'
  # resource :items

  get "/items", to: "items#index", as: "items"
  post "/items", to: "items#create"
  get "/items/new", to: "items#new", as: "new_items"
  get "/items/:id", to: "items#show", as: "item"
  put "/items/:id", to: "items#update"
  patch "/items/:id", to: "items#update"
  delete "/items/:id", to: "items#destroy"
  get "/items/:id/edit", to: "items#edit", as: "edit_items"
  post '/comment', to: 'comment#create', as: 'create_comment'
  post '/order_items', to: 'order_items#create', as: 'create_order_items'
  put "/order_items/:id", to: "order_items#update"
  patch "/order_items/:id", to: "order_items#update"
  get "/cards/", to: "cards#show", as: "cards"
  
end
