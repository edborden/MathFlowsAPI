source 'https://rubygems.org'
ruby '2.2.3'

## RAILS
gem 'rails', '4.2.4'
gem 'rails-api', "0.4.0"
gem 'active_model_serializers',"0.8.3"
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem 'pg'
gem 'rack-cors', require: 'rack/cors'

## GOOGLE
gem 'google-api-client'

## MODEL CLONING
gem 'amoeba'

## IMAGE HANDLING
gem 'cloudinary'

## LATEX PARSING
gem 'math-to-itex'

## PDF GENERATION
gem 'prawn'
gem "prawn-svg"

## ENV MANAGEMENT
gem 'figaro'

## USERVOICE
gem 'uservoice-ruby'

## ANALYTICS
gem 'keen'

## IMAGE UTILS
gem 'image_size'
gem 'chunky_png'

## EMAIL
gem 'mandrill_mailer'
gem 'mailchimp-api'

group :test do
	gem "faker"
	gem "shoulda"
	gem "database_cleaner"
	gem 'rspec-rails'
	gem 'factory_girl_rails'
end

group :production do
	gem 'rails_12factor'
	gem 'newrelic_rpm'
end