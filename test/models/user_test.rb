require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = Fabricate :user
	end

	test "groupvitations" do
		groupvitation = Groupvitation.create sender_id:@user.id,receiver_email:"test"
		assert_equal groupvitation,@user.groupvitations_sent.first
		groupvitation.receiver = @user
		groupvitation.declined = true
		groupvitation.save
		assert_equal 0,@user.groupvitations.count
	end

end