require 'test_helper'

class LinesControllerTest < ActionController::TestCase

	def setup
		user_with_block
	end

	test "create" do
		authenticated_req :post,:create,{line:{block_id:@block.id}},@user
		assert_equal 2,Line.count
	end

	test "create by user who doesnt own block returns forbidden" do
		authenticated_req :post,:create,{line:{block_id:@block.id}},Fabricate(:active_user_with_session)
		assert_equal "403",response.code
		assert_equal 1,Line.count	
	end

	test "update" do
		authenticated_req :put,:update,{id:@line.id,line:{content:"test"}},@user
		assert_equal "200",response.code
		assert_equal json_response["line"]["content"],"test"	
	end

	test "destroy" do
		authenticated_req :delete,:destroy,{id:@line.id},@user
		assert_equal 0,Line.count
	end

	test "destroy by user who doesnt own block returns forbidden" do
		authenticated_req :delete,:destroy,{id:@line.id},Fabricate(:active_user_with_session)
		assert_equal "403",response.code
		assert_equal 1,Line.count		
	end

end