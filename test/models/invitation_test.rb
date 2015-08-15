require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
	should validate_presence_of :referral_email

	test "cannot be created without referrer_id" do
		assert_raises_invalid {Invitation.new(referral_email:"test").save(validate:false)}
		assert_raises_invalid {Invitation.create! referral_email:"test"}
	end

	test "cannot be created without referral_email" do
		assert_raises_invalid {Invitation.new(referrer_id:1).save(validate:false)}
		assert_raises_invalid {Invitation.create! referrer_id:1}
	end

	test "cannot be created if referral_email is already used" do
		user1 = Fabricate :user
		Invitation.create referral_email:"test",referrer_id:user1.id
		user2 = Fabricate :user
		assert_raises_invalid {Invitation.new(referral_email:"test",referrer_id:user2.id).save(validate:false)}
		assert_raises_invalid {Invitation.create! referral_email:"test",referrer_id:user2.id}
	end

	test "destroyed when referrer is destroyed" do
		user = Fabricate :user
		Invitation.create referrer_id:user.id,referral_email:"test"
		assert_equal 1,Invitation.count
		user.destroy
		assert_equal 0,Invitation.count
	end

	test "referral_id nullified when referral is destroyed" do
		referrer = Fabricate :user
		referral = Fabricate :user
		invitation = Invitation.create referrer_id:referrer.id,referral_email:"test",referral_id:referral.id
		referral.destroy
		assert_equal nil,invitation.reload.referral_id
	end

end