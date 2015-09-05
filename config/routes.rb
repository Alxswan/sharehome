# == Route Map
#
#    Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         pages#home
# edit_user GET    /users/edit(.:format)     users#edit
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
#      user GET    /users/:id(.:format)      users#show
#           DELETE /users/:id(.:format)      users#destroy
#     homes GET    /homes(.:format)          homes#index
#           POST   /homes(.:format)          homes#create
#  new_home GET    /homes/new(.:format)      homes#new
# edit_home GET    /homes/:id/edit(.:format) homes#edit
#      home GET    /homes/:id(.:format)      homes#show
#           PATCH  /homes/:id(.:format)      homes#update
#           PUT    /homes/:id(.:format)      homes#update
#           DELETE /homes/:id(.:format)      homes#destroy
#     rooms GET    /rooms(.:format)          rooms#index
#           POST   /rooms(.:format)          rooms#create
#  new_room GET    /rooms/new(.:format)      rooms#new
# edit_room GET    /rooms/:id/edit(.:format) rooms#edit
#      room GET    /rooms/:id(.:format)      rooms#show
#           PATCH  /rooms/:id(.:format)      rooms#update
#           PUT    /rooms/:id(.:format)      rooms#update
#           DELETE /rooms/:id(.:format)      rooms#destroy
#     login GET    /login(.:format)          session#new
#           POST   /login(.:format)          session#create
#           DELETE /login(.:format)          session#destroy
#

Rails.application.routes.draw do
  root :to => 'pages#home'
  get '/pages/new' => 'pages#new_user'
  get '/users/edit' => 'users#edit', :as => :edit_user
  resources :users, :except => [:edit]
  resources :homes
  resources :rooms

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
