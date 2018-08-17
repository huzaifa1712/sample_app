Rails.application.routes.draw do
  resources :users #This one line adds all the routes needed for a
  #RESTful Users resource
  #Now we need to set up these routes (show, index etc) in the Users controller
  get '/signup', {to:'users#new'}
  #Routes
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/users', to: 'users#index'
  post '/signup', to: 'users#create'

  #Sessions - stateful communication between server and client, where info like
  #e.g user logged in or not stored. Sessions use cookies to store this info instead of
  # the db.
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
