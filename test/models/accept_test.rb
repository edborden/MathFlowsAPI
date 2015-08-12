require 'test_helper'

class AcceptTest < ActiveSupport::TestCase

	test "accepts" do
		@group = Group.create
		@sender = Fabricate :active_user
		@group.users << @sender
		@receiver = Fabricate :active_user
		@groupvitation = Groupvitation.create sender_id:@sender.id,receiver_id:@receiver.id,receiver_email:@receiver.email
		
		Accept.new @receiver,@groupvitation

		assert_equal @group,@receiver.group
		assert @groupvitation.accepted
	end

end