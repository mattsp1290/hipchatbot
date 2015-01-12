# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load a YAML configuration file
# The format is similar to secrerts.yml
# Expected variables:
# bot_name
# hipchat_key

YAML.load_file("#{::Rails.root}/config/configuration.yml")[::Rails.env].each {|k,v| ENV[k] = v }

# Initialize the Rails application.
Rails.application.initialize!
