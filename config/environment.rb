# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Rails.logger = Le.new('481bd812-2a5e-4eac-b884-9e4fa38be2ef', :debug => true, :local => true)