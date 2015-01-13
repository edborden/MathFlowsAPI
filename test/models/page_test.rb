require 'test_helper'

class PageTest < ActiveSupport::TestCase

	test "create_default" do
		p = Page.create_default
		assert_equal 2,Position.count
		assert_equal 1,Block.count
		assert_equal 1,Snippet.count
		assert_equal 1,p.child_positions.count
	end

end