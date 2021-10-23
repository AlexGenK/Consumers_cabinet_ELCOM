require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ConsumersCabinetElcom
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.i18n.default_locale = :uk

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.action_view.field_error_proc = Proc.new { |html_tag, instance| 
      class_attr_index = html_tag.index 'class="'

      if class_attr_index
        html_tag.insert class_attr_index + 7, 'is-invalid '
      else
        html_tag.insert html_tag.index('>'), ' class="is-invalid"'
      end   
    }
  end
end
