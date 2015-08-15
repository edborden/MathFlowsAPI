require 'test_helper'

class GroupTest < ActiveSupport::TestCase

	def setup
		@group = Group.create
		@user = Fabricate :user
		@group.users<<@user
	end

	test "users_count works" do
		@user = Fabricate :user
		@group.users << @user
		assert_equal 2,@group.users(true).size
		@group.users.delete @user
		assert_equal 1,@group.users(true).size
	end

	test "group is destroyed when users_count reaches 0" do
		@group.users.delete @user
		assert_equal 0,Group.count
	end

end