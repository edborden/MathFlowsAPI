require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

	def setup
		@user = Fabricate :active_user_with_session
	end

	## AUTHENTICATED CONTROLLER

	test "get to index without token returns unauthorized" do
		get :index
		assert_equal 401,@response.status		
	end

	test "get to index with token in params returns OK" do
		get :index, {token: @user.session.token}
		assert_equal 200,@response.status
	end

	test "get to index with token in header returns OK" do
		authenticated_req :get, :index, nil, @user
		assert_equal 200,@response.status
	end

	## SESSIONS CONTROLLER

	test "post to create with issue creates guest user" do
		post :create, {session:{token:"issue"}}
		assert_equal 2,User.count
		assert json_response["session"]
		assert_equal true,json_response["users"][0]["guest"]
	end

	test "post to create with guest credentials converts user" do
		skip
	end

	test "get to index returns user session" do
		get :index, {token: @user.session.token}
		assert_equal @user.session.id,json_response["sessions"][0]["id"]
	end

	test "delete to destroy destroys session and returns 204" do
		authenticated_req :delete,:destroy,{id:@user.session.id},@user
	end
	
end