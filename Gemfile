source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.4'
gem 'rails-api', "0.4.0"
gem 'active_model_serializers',"0.8.3"
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem 'pg'
gem 'prawn',"~> 1.3.0" #image error with newest version
gem 'rack-cors', require: 'rack/cors'
gem 'google-api-client'
gem 'amoeba'
gem 'cloudinary'

##USERVOICE
gem 'uservoice-ruby'

## ANALYTICS
gem 'keen'

## IMAGE UTILS
gem 'data_uri'
gem 'image_size'

## EMAIL
gem 'mandrill_mailer'
gem 'mailchimp-api', require: 'mailchimp'

group :development,:test do
	gem 'rspec-rails'
	gem 'factory_girl_rails'
end

group :test do
	gem "faker"
	gem "shoulda"
	gem "database_cleaner"
end

group :production do
	gem 'rails_12factor'
	gem 'newrelic_rpm'
	gem 'unicorn', platforms: :ruby
	#gem 'le'
end