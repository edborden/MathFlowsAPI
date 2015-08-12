require 'test_helper'

class FoldersControllerTest < ActionController::TestCase

	def setup
		user_with_block
	end

	test "create" do
		authenticated_req :post,:create,{folder:{name:"Test Name"}},@user
		assert_equal 2,Folder.count
	end

	test "update" do
		authenticated_req :put,:update,{id:@folder.id,folder:{name:"New Name"}},@user
		assert_equal json_response["folder"]["name"],"New Name"
	end

	test "update, not owner" do
		not_owner = Fabricate :active_user_with_session
		authenticated_req :put,:update,{id:@folder.id,folder:{name:"New Name"}},not_owner
		assert_equal "403",response.code		
	end

	test "destroy" do
		authenticated_req :delete,:destroy,{id:@folder.id},@user
	end

end