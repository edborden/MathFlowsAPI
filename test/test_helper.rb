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

	def user_with_block
		@user = Fabricate :active_user_with_session
		@folder = Folder.create user_id:@user.id
		@test = Test.create user_id:@user.id,folder_id:@folder.id
		@page = Page.create test_id: @test.id
		@block = Block.create user_id:@user.id
		@line = Line.create block_id:@block.id,content: Faker::Lorem.characters(10)
	end

end
