require 'test_helper'

class SessionTest < ActiveSupport::TestCase

	test "session cannot be created without user_id" do
		assert_raises_invalid {Session.create! token:"test"}
	end

	test "session cannot be created without token" do
		assert_raises_invalid {Session.create! user_id:1}
	end

	test "session is destroyed when user is destroyed" do
		user = User.create.create_session
		assert_equal 1,Session.count
		user.destroy
		assert_equal 0,Session.count
	end

end