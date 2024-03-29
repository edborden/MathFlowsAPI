# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# DO NOT Add additional requires below this line. Rails is not loaded until this point!
# INSTEAD...put requires in dedicated files in spec/support so that folks browsing this
# can see all the config for a testing gem in one easy-to-find, well-named file.

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # See database_cleaner.rb about config.use_transactional_fixtures
  # config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!
end

shared_context "user_with_block" do
  let(:user) { create :user_with_session }
  let(:folder) { create :folder, user:user }
  let(:test)  { create :test, user:user,folder:folder }
  let(:page) { create :page, test: test }
  let(:block) { create :block, user:user,page:page }
  let(:line) { create :line, lineable:block }
end

shared_context "eager_user_with_block" do
  let!(:user) { create :user_with_session }
  let!(:folder) { create :folder, user:user }
  let!(:test)  { create :test, user:user,folder:folder }
  let!(:page) { create :page, test: test }
  let!(:block) { create :block, user:user,page:page }
  let!(:line) { create :line, lineable:block }
end

def authenticated_req type,method,params,user
  send type,method,params, {'Authorization' => 'Bearer ' + user.session.token}
end

def json_response
  @json_response ||= JSON.parse @response.body
end