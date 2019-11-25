# Per this lesson here:
# https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-5-crud-with-rails/rails-generators
# The following command was enterefd:
# .../rails-sandbox-1$ rails g controller admin dashboard stats financials settings --no-test-framework
#...and it generates the following output, creating a bunch of stuff:

# Running via Spring preloader in process 44873
#       create  app/controllers/admin_controller.rb
#        route  get 'admin/dashboard'
# get 'admin/stats'
# get 'admin/financials'
# get 'admin/settings'
#       invoke  erb
#       create    app/views/admin
#       create    app/views/admin/dashboard.html.erb
#       create    app/views/admin/stats.html.erb
#       create    app/views/admin/financials.html.erb
#       create    app/views/admin/settings.html.erb
#       invoke  helper
#       create    app/helpers/admin_helper.rb              <= This is this file!
#       invoke  assets
#       invoke    scss
#       create      app/assets/stylesheets/admin.scss
module AdminHelper
end
