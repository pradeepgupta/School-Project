# Settings specified here will take precedence over those in config/environment.rb

# Development gems.

# Debugging.
config.gem 'ruby-debug'
config.gem 'josevalim-rails-footnotes',       :lib => 'rails-footnotes'
config.gem 'internuity-quick_scopes',         :lib => 'quick_scopes'
config.gem 'cldwalker-hirb',                  :lib => 'hirb'

# Deployment.
config.gem 'capistrano'
config.gem 'capistrano-ext',                  :lib => 'capistrano'
#config.gem 'eric-gemist',                     :lib => 'gemist'

# Scaffolding (generators).
config.gem 'grimen-dry_scaffold',             :lib => false

# Optimization.
#config.gem 'wvanbergen-request-log-analyzer', :lib => 'request-log-analyzer'

# Documentation.
config.gem 'bryanlarsen-railroad',            :lib => 'railroad'

# Data generation.
config.gem 'notahat-machinist',               :lib => 'machinist'
config.gem 'sevenwire-forgery',               :lib => 'forgery'

# E-mails.
config.gem 'cwninja-inaction_mailer',         :lib => 'inaction_mailer/force_load'

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs = true
config.action_controller.perform_caching = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false