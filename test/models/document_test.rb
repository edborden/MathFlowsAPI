require 'test_helper'

class DocumentTest < ActiveSupport::TestCase

	test "create_default" do
		d = Document.create_default
		assert_equal 1,Page.count
		assert_equal 2,Position.count
		assert_equal 1,Block.count
		assert_equal 1,Snippet.count
		assert_equal 1,d.pages.count
	end

end