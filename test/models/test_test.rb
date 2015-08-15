require 'test_helper'

class TestTest < ActiveSupport::TestCase

	test "can access blocks" do
		user_with_block
		assert_equal @test.blocks.first,@block
	end

	test "test cannot be created without user_id" do
		assert_raises_invalid {Test.create folder_id:1}
	end

	test "test cannot be created without folder_id" do
		assert_raises_invalid {Test.create user_id:1}
	end

	test "test is destroyed when user is destroyed" do
		user_with_block
		@user.destroy
		assert_equal 0,Test.count
	end

	test "test is destroyed when folder is destroyed" do
		user_with_block
		@folder.destroy
		assert_equal 0,Test.count
	end

end