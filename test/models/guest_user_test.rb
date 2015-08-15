require 'test_helper'

class GuestUserTest < ActiveSupport::TestCase

	test "creates guest user and intro folder/test" do
		user = GuestUser.new.user
		assert user.valid?
		assert_equal 1,Folder.count
		assert_equal 1,Test.count
		assert_equal 1,Page.count
		assert_not_equal 0,Block.count
	end

end