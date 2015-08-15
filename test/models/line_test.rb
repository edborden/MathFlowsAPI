require 'test_helper'

class LineTest < ActiveSupport::TestCase

	test "line cannot be created without block_id" do
		assert_raises_invalid {Line.create}
	end

	test "line is destroyed if block is destroyed" do
		user_with_block
		@block.destroy
		assert_equal 0,Line.count
	end

end