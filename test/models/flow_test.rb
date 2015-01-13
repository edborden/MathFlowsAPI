require 'test_helper'

class FlowTest < ActiveSupport::TestCase

	test "create_default" do
		f = Flow.create_default
		assert_equal 1,Document.count
		assert_equal 1,Page.count
		assert_equal 2,Position.count
		assert_equal 1,Block.count
		assert_equal 1,Snippet.count
		assert_equal 1,f.documents.count
	end

end