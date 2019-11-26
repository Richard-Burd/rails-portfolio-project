# If you are new to setting up GitHub OmniAuth (AKA OAuth) - see my notes here first:
# config/routes.rb

# OmniAuth Video in Flatiron curriculum is here: https://www.youtube.com/watch?v=UAvuo-EbTFY (7:40 / 56:18)

# Create a new file in this directory called omniauth.rb (config/initializers/omniauth.rb)
# copy & paste the code below into that new file here: config/initializers/omniauth.rb
# next, you will get the client key & client secret from you OAuth App that you will have created here:
# https://github.com/settings/developers
# and you will put them in the appropriate lines below.
# WARNING - WARNING -WARNING - WARNING -WARNING - WARNING
# Do not put your client key & client secret in this (omniauth_boilerplate.rb) file, because this file
# will be uploaded to GitHub, the "omniauth.rb" file on the other hand, will not be uploaded because it
# is listed in the ".gitignore" file that is located in the root directory of this Rails app.

# Rails.application.config.middleware.use OmniAuth::Builder do                  # un-comment this line here in "config/initializers/omniauth.rb" so the code will run
#                     # client key - identifies the GitHub application
#   provider :github, 'the-client-id-key-goes-in-these-quotes-right-here',      # un-comment this line here in "config/initializers/omniauth.rb" so the code will run
#
#                     # client secret - the password for the GitHub application
#                     'the-client-secret-key-goes-in-these-quotes-right-here'   # un-comment this line here in "config/initializers/omniauth.rb" so the code will run
# end                                                                           # un-comment this line here in "config/initializers/omniauth.rb" so the code will run
