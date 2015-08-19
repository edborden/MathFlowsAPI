require File.expand_path('../boot', __FILE__)

require 'rails/all'


Bundler.require(*Rails.groups)

module MathFlows
	class Application < Rails::Application

		config.active_record.raise_in_transactional_callbacks = true

		config.middleware.insert_before 0, "Rack::Cors" do
			allow do
				origins '*'
				resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :options, :delete]
			end
		end
		
		MandrillMailer.configure do |config|
			config.api_key = "05AGnHwxdAK5OVfFd6Ev_g"
		end

		config.generators do |g|
			g.test_framework :rspec,
				:fixtures => true,
				:view_specs => false,
				:helper_specs => false,
				:routing_specs => false,
				:controller_specs => true,
				:request_specs => true
			g.fixture_replacement :factory_girl, :dir => "spec/factories"
		end

	end
end
