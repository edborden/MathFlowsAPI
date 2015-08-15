require 'test_helper'

class BlocksControllerTest < ActionController::TestCase

	def setup
		user_with_block
	end

	test "post to create with copy_from_id runs BlockCopy" do
		BlockCopy.expects(:new).with(@block.id.to_s,@user).returns(stub(block:Block.create(user_id:@user.id)))
		authenticated_req :post,:create,{block:{copy_from_id:@block.id}},@user
		assert_equal @user.id,json_response["block"]["user_id"].to_i
	end

	test "post to create creates new block with default line for user" do
		authenticated_req :post,:create,{block:{page_id:@page.id}},@user
		assert_equal @user,Block.last.user
		assert json_response["lines"][0]
	end

	test "post to create when user isnt owner of page return forbidden" do		
		authenticated_req :post,:create,{block:{page_id:@page.id}},Fabricate(:active_user_with_session)
		assert_equal "403",response.code
		assert_equal 1,Block.count
	end

	test "update" do
		authenticated_req :put,:update,{id:@block.id,block:{row_span:4,col_span:1,row:1,col:1}},@user
		assert_equal 4,@block.reload.row_span
	end

	test "show" do
		authenticated_req :get,:show,{id:@block.id},@user
		assert_equal @block.id,json_response["block"]["id"]
	end

	test "destroy" do
		authenticated_req :delete,:destroy,{id:@block.id},@user
		assert_equal 0,Block.count
	end

end