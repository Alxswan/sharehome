# == Route Map
#
#        Prefix Verb   URI Pattern                  Controller#Action
# messages_show GET    /messages/show(.:format)     messages#show
#          root GET    /                            pages#home
#           new GET    /new(.:format)               pages#new_user
#    pages_join GET    /pages/join(.:format)        pages#join
#               GET    /bills/split/:id(.:format)   bills#split
#               GET    /bills/simple/:id(.:format)  bills#simple
# homes_results GET    /homes/results(.:format)     homes#results
#         users GET    /users(.:format)             users#index
#               POST   /users(.:format)             users#create
#      new_user GET    /users/new(.:format)         users#new
#     edit_user GET    /users/:id/edit(.:format)    users#edit
#          user GET    /users/:id(.:format)         users#show
#               PATCH  /users/:id(.:format)         users#update
#               PUT    /users/:id(.:format)         users#update
#               DELETE /users/:id(.:format)         users#destroy
#         homes GET    /homes(.:format)             homes#index
#               POST   /homes(.:format)             homes#create
#      new_home GET    /homes/new(.:format)         homes#new
#     edit_home GET    /homes/:id/edit(.:format)    homes#edit
#          home GET    /homes/:id(.:format)         homes#show
#               PATCH  /homes/:id(.:format)         homes#update
#               PUT    /homes/:id(.:format)         homes#update
#               DELETE /homes/:id(.:format)         homes#destroy
#      messages GET    /messages(.:format)          messages#index
#               POST   /messages(.:format)          messages#create
#   new_message GET    /messages/new(.:format)      messages#new
#  edit_message GET    /messages/:id/edit(.:format) messages#edit
#       message GET    /messages/:id(.:format)      messages#show
#               PATCH  /messages/:id(.:format)      messages#update
#               PUT    /messages/:id(.:format)      messages#update
#               DELETE /messages/:id(.:format)      messages#destroy
#         rooms GET    /rooms(.:format)             rooms#index
#               POST   /rooms(.:format)             rooms#create
#      new_room GET    /rooms/new(.:format)         rooms#new
#     edit_room GET    /rooms/:id/edit(.:format)    rooms#edit
#          room GET    /rooms/:id(.:format)         rooms#show
#               PATCH  /rooms/:id(.:format)         rooms#update
#               PUT    /rooms/:id(.:format)         rooms#update
#               DELETE /rooms/:id(.:format)         rooms#destroy
#         bills GET    /bills(.:format)             bills#index
#               POST   /bills(.:format)             bills#create
#      new_bill GET    /bills/new(.:format)         bills#new
#     edit_bill GET    /bills/:id/edit(.:format)    bills#edit
#          bill GET    /bills/:id(.:format)         bills#show
#               PATCH  /bills/:id(.:format)         bills#update
#               PUT    /bills/:id(.:format)         bills#update
#               DELETE /bills/:id(.:format)         bills#destroy
#         login GET    /login(.:format)             session#new
#               POST   /login(.:format)             session#create
#               DELETE /login(.:format)             session#destroy
#

Rails.application.routes.draw do

  get 'messages/show'

  root :to => 'pages#home'
  get '/new' => 'pages#new_user'
  get '/pages/join' => 'pages#join'
  get '/bills/split/:id' => 'bills#split'
  get '/bills/simple/:id' => 'bills#simple'
  get '/homes/results' => 'homes#results'
  # get '/users/edit' => 'users#edit', :as => :edit_user
  resources :users  
  resources :homes 
  resources :messages
  resources :rooms
  resources :bills


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
