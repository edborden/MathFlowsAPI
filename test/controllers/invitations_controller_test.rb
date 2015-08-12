require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase

	def setup
		@referrer = Fabricate :active_user_with_session
	end

	test "invitation creates" do
		authenticated_req :post, :create, {invitation:{referral_email:"test"}}, @referrer
		assert_equal 1,Invitation.count
		assert_equal "test",Invitation.first.referral_email	
		assert_equal @referrer,Invitation.first.referrer
	end

	test "post returns error if tries to invite someone who already has an invitation" do
		Invitation.create referral_email:"test",referrer_id:@referrer.id
		authenticated_req :post, :create, {invitation:{referral_email:"test"}}, @referrer
		assert_equal 1,Invitation.count	
		assert json_response["errors"]["referral_email"].include? "has already been taken"
	end

	test "post returns error if tries to invite someone who is already signed up" do
		referral = Fabricate :user, email: "test@test.com"
		authenticated_req :post, :create, {invitation:{referral_email:"test@test.com"}}, @referrer
		assert_equal 0,Invitation.count	
		assert json_response["errors"]["referral_email"].include? "already a user"
	end

	test "post to visit with no token runs visit" do
		invitation = Fabricate :invitation,referrer_id:@referrer.id,referral_email:"test@test.com"
		Visit.expects(:new)
		post :visit, {id:invitation.id}
		assert_equal "204",response.code
	end

end