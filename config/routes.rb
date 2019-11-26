Rails.application.routes.draw do

  # This is the page your app will display when you go to the root URL
  root 'site#index'
  get 'site/index'

  # These are the routes used to manage users
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"

  # go to this video here: https://www.youtube.com/watch?v=UAvuo-EbTFY
  # look at this part of the video: 6:12 / 56:18 (timestamp)
  # at the 6:51 mark, Avi sets the "Authorization callback URL" (in his newly created OAuth GitHub app) to the following:
  # http://localhost:3000/auth/github/callback
  # the get request below must match the "Authorization callback URL" you specify in the GitHub OAuth app.
  get '/auth/:provider/callback' => 'sessions#create' # OmniAuth : https://www.youtube.com/watch?v=UAvuo-EbTFY (10:14 / 56:18)
  # You can create a new OAuth (same thing as OmniAuth) on GitHub by going here: https://github.com/settings/developers

  # The second part of this OmniAuth business is to go to this directory: config/initializers
  # and create a file called "omniauth.rb"
  # WARNING WARNING WARNING - this "omniauth.rb" file will contain sensitive data, so if you haven't done so already, you first need to create
  # a ".gitignore" file in the root directory and then specifically include this file: config/initializers/omniauth.rb
  # INFO INFO INFO - If you're using this Rails app as a starting point for your Rails project, relax, the ".gitignore" has already been created for you,
  # and it includes the "config/initializers/omniauth.rb" - this means no sensitive data will be compromised.

  # In this project there is a file here: config/initializers/omniauth_boilerplate.rb
  # this explains the formatting of the hidden omniauth.rb file in the same directory

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
