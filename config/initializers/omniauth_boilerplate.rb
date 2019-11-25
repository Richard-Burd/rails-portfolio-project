# https://www.youtube.com/watch?v=UAvuo-EbTFY (7:40 / 56:18)
# OmniAuth Video

# This Sinatra code was copied from here:
# https://github.com/omniauth/omniauth-github
# use OmniAuth::Builder do
#   # provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']

#   # NOTE; you cannot push this code to github because it will give people access
#   # to your github account.
#   # ENV['GITHUB_KEY'] = 0c................8f
#   # ENV['GITHUB_SECRET'] = e4.........................................45
#   provider :github, '0c................8f', 'e4.........................................45'

# end

# This was also copied from watching the above video:
Rails.application.config.middleware.use OmniAuth::Builder do
                    # client key - identifies the GitHub application
  provider :github, 'the-client-id-key-goes-in-these-quotes-right-here',

                    # client secret - the password for the GitHub application
                    'the-client-secret-key-goes-in-these-quotes-right-here'
end
