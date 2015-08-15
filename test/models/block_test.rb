require 'test_helper'

class BlockTest < ActiveSupport::TestCase

	def setup
		user_with_block
	end

	#if user delete block directly from test, block is deleted (BlocksControllerTest#destroy)

	test "if user deletes page that block is on, block is deleted" do
		@page.destroy
		assert_equal 0,Block.count
	end

	test "if user deletes test block is on, block's user_id and page_id is nullified and block is not deleted" do
		@test.destroy
		assert_equal 1,Block.count
		assert_equal nil,@block.user_id
		assert_equal nil,@block.page_id				
	end

	test "if user deletes folder block is on, block's user_id and page_id is nullified and block is not deleted" do
		@folder.destroy
		assert_equal 1,Block.count
		assert_equal nil,@block.user_id
		assert_equal nil,@block.page_id				
	end

	test "if block's user is deleted, block's user_id and page_id is nullified and block is not deleted" do
		@user.destroy
		assert_equal 1,Block.count
		assert_equal nil,@block.reload.user_id		
		assert_equal nil,@block.reload.page_id				
	end

end