require 'test_helper'

class GroupTest < ActiveSupport::TestCase

	test "users_count works" do
		group = Group.create
		user = Fabricate :user
		assert_equal 0,group.users.size
		group.users<<user
		assert_equal 1,group.users.size
	end

end