require File.expand_path('../boot', __FILE__)

require 'rails/all'


Bundler.require(*Rails.groups)

module MathFlows
	class Application < Rails::Application

		config.middleware.insert_before 0, "Rack::Cors" do
			allow do
				origins '*'
				resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :options, :delete]
			end
		end
		
		MandrillMailer.configure do |config|
			config.api_key = "05AGnHwxdAK5OVfFd6Ev_g"
		end

	end
end
