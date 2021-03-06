# encoding: utf-8

# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  
  # Specify gems that this application depends on and have them installed with rake gems:install
  
  # Authentication + Authorization.
  config.gem 'authlogic'
  # config.gem 'josevalim-auth_helpers',          :lib => 'auth_helpers' # Using submodule grimen/auth_helpers - awaiting patch approval
  config.gem 'declarative_authorization'
  
  # Models.
  config.gem 'friendly_id'
  #config.gem 'redinger-validation_reflection',  :lib => 'validation_reflection'  # Using submodule - gem has some issues
  
  # Views: Frameworks + Templating.
  config.gem 'haml'
  config.gem 'compass'
  config.gem 'sprockets',                       :lib => false
  config.gem 'RedCloth',                        :lib => false
  
  # Views: Forms.
  config.gem 'formtastic'
  config.gem 'simple_form'
  
  # Controllers.  
  if RUBY_VERSION >= '1.9'
    # gem built from: grimen/inherited_resources, patch-work in progress... (might break with newer versions)
    config.gem 'inherited_resources'
  else
    config.gem 'inherited_resources'
  end
  
  # MVC.
  config.gem 'will_paginate'
  
  # Configuration.
  config.gem 'settingslogic'
  
  # Database population.
  config.gem 'grimen-bootstrapper',           :lib => 'bootstrapper', :version => '>= 0.1.3'
  
  # E-mails.
 # config.gem 'grimen-awesome_email',          :lib => 'awesome_email', :version => '>= 0.1.3'
#  config.gem 'grimen-delayed_job_mailer',     :lib => 'delayed_job_mailer', :version => '>= 0.1.2'
  # For embedding images (etc.) in e-mails:
  # config.gem 'JasonKing-inline_attachment',   :lib => 'inline_attachment'
  
  # Crontab.
#  config.gem 'javan-whenever',                :lib => false
  
  # Job queue
  config.gem 'delayed_job'
  
  # Domains.
  config.gem 'subdomain-fu'
  
  # Paperclip
  config.gem 'paperclip'
  
  # IE
#  config.gem 'sant0sk1-rack-noie6',           :lib => 'noie6'
  
  # Misc.
#  config.gem 'polyglot',                      :lib => 'polyglot', :version => '>= 0.2.9' # Ruby 1.9.x
  
  # Facebook integration.
  # config.gem 'facebooker',                    :lib => 'facebooker'  # Using submodule grimen/facebooker
  
  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [:all]
  
  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [:active_record, :active_resource, :action_mailer]
  
  # Add additional load paths for your own custom dirs
  config.load_paths += [
      Rails.root.join('lib', 'middleware')
    ]
    
  # Cache storage locations.
  config.action_controller.page_cache_directory = Rails.root.join('public', 'cache')
  config.action_controller.cache_store = [:file_store, Rails.root.join('tmp', 'cache', 'fragments')]
  # config.action_controller.cache_store = :mem_cache_store
  
  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
  
  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'
  
end
