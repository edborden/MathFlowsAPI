require 'test_helper'

class GroupvitationsControllerTest < ActionController::TestCase

	def setup
		@group = Group.create
		@sender = Fabricate :active_user_with_session
		@group.users << @sender
		@receiver = Fabricate :active_user_with_session
	end

	test "sets receiver_id if receiver exists" do
		authenticated_req :post, :create, {groupvitation:{receiver_email:@receiver.email}}, @sender
		assert_equal @sender.groupvitations_sent.first.receiver_id,@receiver.id
	end

	#user tries to join a groupvitation they are already in

	test "accept" do 
		create_groupvitation
		Accept.expects(:new).with(@receiver,@groupvitation).returns(stub(group:Group.create))
		authenticated_req :post, :accept, {id:@groupvitation.id}, @receiver
	end

	test "decline" do
		create_groupvitation
		Decline.expects(:new).with @groupvitation
		authenticated_req :post, :decline, {id:@groupvitation.id}, @receiver	
	end

	test "destroy" do
		create_groupvitation
		authenticated_req :delete, :destroy, {id:@groupvitation.id},@sender
		assert_equal 0,Groupvitation.count
	end

	def create_groupvitation
		@groupvitation = Groupvitation.create sender_id:@sender.id,receiver_id:@receiver.id,receiver_email:@receiver.email		
	end

end