Rails.application.routes.draw do

  # This is the page your app will display when you go to the root URL
  root 'site#index'
  get 'site/index'

  # These are the routes used to manage users
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/auth/:provider/callback' => 'sessions#create' # OmniAuth : https://www.youtube.com/watch?v=UAvuo-EbTFY (10:14 / 56:18)

  # users in the convoy app actually own vehicles...so vehicles become nested.
  # the users are not shown under routes specific to the convoy app
  # resources :users

  # This is the default index for the app.  It should be renamed to s.thing
  # relevant to the app name itself.
  # The default root pathis reserved for what a user sees when they are
  # not yet logged in.
  get '/burdapp' => "site#burdapp"

  # Routes specific to the convoy app:
  resources :trips #=> each convoy has a trip

  resources :users do
    resources :vehicles
  end

end
