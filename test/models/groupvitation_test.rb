require 'test_helper'

class GroupvitationTest < ActiveSupport::TestCase

	test "group" do

		@group = Group.create
		@sender = Fabricate :user
		@group.users << @sender
		@receiver = Fabricate :user
		@groupvitation = Groupvitation.create sender_id:@sender.id,receiver_id:@receiver.id,receiver_email:@receiver.email
		assert_equal @group,@groupvitation.group

	end

end