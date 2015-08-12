require 'test_helper'

class BlockCopyTest < ActiveSupport::TestCase

	def setup
		user_with_block
		@other_user = Fabricate :user
		BlockCopy.new @block.id,@other_user
	end

	test "creates copied block and sets to current_user" do
		assert_equal @other_user.blocks.first,Block.last
	end

	test "block copies lines" do
		assert_equal 2,Block.count
		assert_equal @block.lines.first.content,Block.last.lines.first.content
	end

end