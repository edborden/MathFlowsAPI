require 'test_helper'

class PreferencesControllerTest < ActionController::TestCase

	def setup
		@user = Fabricate(:active_user_with_session)
	end

	test "update" do
		authenticated_req :put,:update,{id:@user.preference.id,preference:{borders:true}},@user
		assert_equal "200",response.code
		assert_equal true,json_response["preference"]["borders"]
	end

	test "update from user who doesnt own preferece returns forbidden" do
		authenticated_req :put,:update,{id:@user.preference.id,preference:{borders:true}},Fabricate(:active_user_with_session)
		assert_equal "403",response.code
	end
end