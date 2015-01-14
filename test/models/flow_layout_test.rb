require 'test_helper'

class FlowLayoutTest < ActiveSupport::TestCase

	test "default" do
		f = FlowLayout.default
		assert f.is_a? FlowLayout
	end

end