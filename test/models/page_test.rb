require 'test_helper'

class PageTest < ActiveSupport::TestCase

	test "page cannot be created without test_id" do
		assert_raises_invalid {Page.create}
	end

	test "page is destroyed when test is destroyed" do
		user_with_block
		@test.destroy
		assert_equal 0,Page.count
	end
end