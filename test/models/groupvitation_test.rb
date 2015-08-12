require 'test_helper'

class GroupvitationTest < ActiveSupport::TestCase

	def setup
		@group = Group.create
		@sender = Fabricate :user
		@group.users << @sender
		@groupvitation = Groupvitation.create sender_id:@sender.id,receiver_id:nil,receiver_email:"nothing@test.com"
	end

	test "can call group" do
		assert_equal @group,@groupvitation.group
	end

	#receiver isn't signed up yet : automatically create matching invitation
	test "create matching invitation if receiver is not signed up yet" do
		assert_equal @sender.invitations_sent.first.referral_email,"nothing@test.com"		
	end

end