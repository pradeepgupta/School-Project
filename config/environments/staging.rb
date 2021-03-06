# encoding: utf-8

# Settings specified here will take precedence over those in config/environment.rb

# Production gems.

# Analytics.
#config.gem 'newrelic_rpm'
#config.gem 'rubaidh-google_analytics',        :lib => 'rubaidh/google_analytics'

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local  = true # *** staging: true, production: false
config.action_controller.perform_caching              = true
config.action_view.cache_template_loading             = true

# See everything in the log (default is :info)
# config.log_level = :debug

# Use a different logger for distributed setups
# Log-rotate: Keep 50 old logfiles of maximum 1 MB each.
config.logger = Logger.new(config.log_path, 3, 1.megabyte)

# Use a different cache store in production
# config.cache_store = :mem_cache_store

# Page cache storage location.
config.action_controller.page_cache_directory = Rails.root.join('public', 'cache')

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host = "http://assets.example.com"
# config.action_controller.asset_host = "http://assets%.example.com"  # => http://assets1.example.com, ...
# config.action_controller.asset_host = Proc.new { |source|
#     case source
#     when /^\/images/
#       "http://images.example.com"
#     else
#       "http://assets.example.com"
#     end
#   }

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

# Enable threaded mode
# config.threadsafe!
