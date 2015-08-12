require 'test_helper'

class DeclineTest < ActiveSupport::TestCase

	def setup
		@group = Group.create
		@sender = Fabricate :active_user_with_session
		@group.users << @sender
		@receiver = Fabricate :active_user_with_session
	end

	test "decline" do
		create_groupvitation
		Decline.new @groupvitation
		assert @groupvitation.reload.declined
		assert_equal 0,@receiver.groupvitations.count		
	end

	def create_groupvitation
		@groupvitation = Groupvitation.create sender_id:@sender.id,receiver_id:@receiver.id,receiver_email:@receiver.email		
	end

end