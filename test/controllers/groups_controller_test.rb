require 'test_helper'

class GroupsControllerTest < ActionController::TestCase

	def setup
		@user1 = Fabricate :user_with_session
		@user2 = Fabricate :user_with_session
	end

	#user can't have open invites to group they don't belong to
	test "sender_leaves_group_removes_old_groupvitations" do
		group = Group.create
		group.users << @user1
		groupvitation = Groupvitation.create sender_id:@user1.id,receiver_id:@user2.id,receiver_email:@user2.email
		authenticated_req :post, :unjoin, nil, @user1
		assert_equal 0,@user1.groupvitations_sent.count
	end
	
end