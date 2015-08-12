require 'test_helper'

class GroupsControllerTest < ActionController::TestCase

	def setup
		@user = Fabricate :active_user_with_session
	end

	test "post to create returns group which contains current user" do
		authenticated_req :post, :create, {group:{name:"Test Group"}}, @user
		assert_equal @user.id,json_response["users"][0]["id"]
	end

	test "unjoin" do		
		Unjoin.expects(:new)
		authenticated_req :post, :unjoin, nil, @user
		assert_equal "204",response.code
	end

	test "update" do
		group = Group.create
		group.users << @user
		authenticated_req :put, :update, {id:group.id,group:{name:"Test Name"}},@user
		assert_equal "Test Name",json_response["group"]["name"]
	end

	test "update from user not in group returns forbidden" do
		group = Group.create
		authenticated_req :put, :update, {id:group.id,group:{name:"Test Name"}},@user
		assert_equal "403",response.code	
	end
	
end