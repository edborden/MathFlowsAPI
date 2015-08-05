require 'test_helper'

class JoinTest < ActiveSupport::TestCase

	test "joins" do
		user = Fabricate :user
		group = Group.create
		Join.new user,group
		assert_equal group,user.group
		assert_equal 1,group.users(true).size
	end

end