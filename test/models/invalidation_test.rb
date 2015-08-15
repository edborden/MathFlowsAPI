require 'test_helper'

class InvalidationTest < ActiveSupport::TestCase

	test "cannot create without block_id" do
		assert_raises_invalid {Invalidation.create message_type:1}
	end

	test "cannot create without message_type" do
		assert_raises_invalid {Invalidation.create block_id:1}
	end

	test "is destroyed when block is destroyed" do
		user_with_block
		Invalidation.create block_id:@block.id,message_type:1
		assert_equal 1,Invalidation.count
		@block.destroy
		assert_equal 0,Invalidation.count		
	end

end