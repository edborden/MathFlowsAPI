require File.expand_path('../boot', __FILE__)

require 'rails/all'


Bundler.require(*Rails.groups)

module MathFlows
	class Application < Rails::Application
		ActiveModel::Serializer.setup do |config|
			config.embed = :ids
			#config.embed_in_root = false
		end

		config.middleware.insert_before 0, "Rack::Cors" do
			allow do
				origins '*'
				resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :options, :delete]
			end
    	end

		config.action_mailer.delivery_method = :smtp
		config.action_mailer.smtp_settings = {
			address:              'smtp.gmail.com',
			port:                 587,
			domain:               'example.com',
			user_name:            'borden.edward@gmail.com',
			password:             'K3tchup15',
			authentication:       'plain',
			enable_starttls_auto: true  }

	end
end
