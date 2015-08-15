require 'test_helper'

class CloseTest < ActiveSupport::TestCase

	def setup
		user_with_block
	end

	test "user's blocks remain in database so that they remain in the block cloud" do
		Close.new(@user)
		assert_equal 1,Block.count		
	end

	test "blocks with invalidations are destroyed" do
		Invalidation.create block_id:@block.id,message_type:1
		Close.new @user
		assert_equal 0,Block.count
	end

	test "user is removed from group" do
		group = Group.create
		group.users << @user
		Close.new @user
		assert_equal 0, Group.count
	end

end