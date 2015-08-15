require 'test_helper'

class VisitTest < ActiveSupport::TestCase

	test "visits" do
		user = Fabricate :user
		invitation = Fabricate :invitation, referrer_id:user.id,referral_email:"test"
		Visit.new invitation
		assert invitation.visited
	end

end