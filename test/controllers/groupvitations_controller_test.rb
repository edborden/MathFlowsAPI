require 'test_helper'

class GroupvitationsControllerTest < ActionController::TestCase

	def setup
		@group = Group.create
		@sender = Fabricate :user_with_session
		@group.users << @sender
		@receiver = Fabricate :user_with_session
	end

	test "sets_receiver_id_if_user_exists" do
		authenticated_req :post, :create, {groupvitation:{receiver_email:@receiver.email}}, @sender
		assert_equal @sender.groupvitations_sent.first.receiver_id,@receiver.id
	end

	#receiver isn't signed up yet : automatically create matching invitation
	test "receiver_not_signed_up_yet" do
		authenticated_req :post, :create, {groupvitation:{receiver_email:"nothing@test.com"}},@sender
		assert_equal @sender.invitations_sent.first.referral_email,"nothing@test.com"		
	end

	#user tries to join a groupvitation they are already in

	test "accept" do 
		groupvitation = Groupvitation.create sender_id:@sender.id,receiver_id:@receiver.id,receiver_email:@receiver.email
		authenticated_req :post, :accept, {id:groupvitation.id}, @receiver
		assert_equal @group,@receiver.reload.group
		assert groupvitation.reload.accepted
	end

	test "decline" do
		groupvitation = Groupvitation.create sender_id:@sender.id,receiver_id:@receiver.id,receiver_email:@receiver.email
		authenticated_req :post, :decline, {id:groupvitation.id}, @receiver
		assert groupvitation.reload.declined
		assert_equal 0,@receiver.groupvitations.count		
	end

end