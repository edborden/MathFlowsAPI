require 'test_helper'

class PositionTest < ActiveSupport::TestCase

	test "create_default,Block" do
		skip
		b = Block.create
		p = Position.create_default b
		assert_equal 1,Snippet.count
		assert_equal 1,Position.count
	end

	test "create_default,Page" do
		skip
		page = Page.create
		p = Position.create_default page
		assert_equal 1,Block.count
		assert_equal 2,Position.count
		assert_equal 1,Snippet.count
		block = Block.first
		assert_equal block,p.positionable	
	end

end