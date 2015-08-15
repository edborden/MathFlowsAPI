require 'test_helper'

class UnjoinTest < ActiveSupport::TestCase

	def setup
		@user1 = Fabricate :active_user_with_session
		@user2 = Fabricate :active_user
		group = Group.create
		group.users << @user1
		groupvitation = Groupvitation.create sender_id:@user1.id,receiver_id:@user2.id,receiver_email:@user2.email
		Unjoin.new @user1
	end

	test "unjoin removes user from group" do
		assert_not @user1.reload.group
	end

	#user can't have open invites to group they don't belong to
	test "sender_leaves_group_removes_old_groupvitations" do
		assert_equal 0,@user1.groupvitations_sent.count
	end

end