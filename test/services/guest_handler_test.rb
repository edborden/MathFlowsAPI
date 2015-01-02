require 'test_helper'

class GuestHandlerTest < ActiveSupport::TestCase

	test "setup" do
		GuestHandler.new.setup
		assert_equal 1,User.count
	end

end