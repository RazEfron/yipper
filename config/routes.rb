Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/yips', to: 'yips#index'
  # #'yips#index' refers to the controller method 'index'

  # patch '/yips/:id', to: 'yips#update'
  # #'yips#update' refers to the controller method 'update'

  # post '/yips', to: 'yips#create'

  # get '/yips/:id', to: 'yips#show'

  # delete '/yips/:id', to: 'yips#destroy'

  #lines 17 and 18 give us the same routes
  # resources :yips, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # resources :users
  # resource :session, only: [ :new, :create, :destroy ]
  # resources :yips, except: [:new, :edit]

  #to get all of the routes
  # resources :yips

  

  root to: "static_pages#root"

  # now we are using rails as data api
  namespace :api, defaults: {format: :json} do
    resources :yips, only: [ :index, :create, :show ]
    resources :users
  end
end

#command + P (or command + T) to search files in VSCode 

#4 things we need for our routes:
  #verb
  #path
  #controller
  #action
  #optional: alias

  #wildcards can be placeholders for any variable, however it is 
  #convention for them to refer to the item's id.  