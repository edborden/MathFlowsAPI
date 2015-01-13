require 'test_helper'

class SnippetTest < ActiveSupport::TestCase

	test "create_default" do
		p = Position.create
		s = Snippet.create_default p
		assert_equal 1,Snippet.count
		assert_equal s.position,p
	end

end