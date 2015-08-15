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

	test "create matching invitation if receiver is not signed up yet" do
		assert_equal @sender.invitations_sent.first.referral_email,"nothing@test.com"		
	end

	test "cannot be created without receiver_email" do
		assert_raises_invalid {Groupvitation.create sender_id:@sender.id}
	end

	test "cannot be created without sender_id" do
		assert_raises_invalid {Groupvitation.create receiver_email:"test"}
	end

	test "destroyed if sender is destroyed" do
		@sender.destroy
		assert_equal 0,Groupvitation.count
	end

	test "destroyed if receiver is destroyed" do
		receiver = Fabricate :user
		@groupvitation.receiver_id = receiver.id
		@groupvitation.save
		assert_equal receiver,@groupvitation.receiver
		receiver.destroy
		assert_equal 0,Groupvitation.count
	end

end