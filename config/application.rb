require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogFlash
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.




    # This was never used in this rails-sandbox-1 workspace but I'm told to delete it...
    # config.action_controller.permit_all_parameters = true
    # ...on this lesson here:
    # https://github.com/Richard-Burd/strong-params-basics-v-000/blob/master/config/application.rb
    # the application.rb for this lesson's workspace is quite different than this one
    # that rails generates automatically.  For example, it has this thing:
    #config.active_record.raise_in_transactional_callbacks = true
  end
end
