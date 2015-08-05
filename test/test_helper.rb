ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/mini_test'

class ActiveSupport::TestCase

	#parses full json response into hash
	def json_response
		@json_response ||= JSON.parse @response.body
	end

	def authenticated_req type,method,params,user
		send type,method,params, {'Authorization' => 'Bearer ' + user.session.token}
	end

end
