require 'test_helper'

class BlockTest < ActiveSupport::TestCase

	test "create_default" do
		skip
		p = Position.create
		b = Block.create_default p
		assert_equal 1,Block.count
		assert_equal 2,Position.count
		assert_equal 1,Snippet.count
		assert_equal 1,b.child_positions.count
		assert b.positions.include? p
	end

end