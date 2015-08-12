require 'test_helper'

class VisitTest < ActiveSupport::TestCase

	test "visits" do
		invitation = Fabricate :invitation
		Visit.new invitation
		assert invitation.visited
	end

end