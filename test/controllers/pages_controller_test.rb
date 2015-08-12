require 'test_helper'

class PagesControllerTest < ActionController::TestCase

	def setup
		user_with_block
	end

	test "create" do
		authenticated_req :post,:create,{page:{test_id:@test.id}},@user
		assert_equal 2,Page.count
	end

	test "create by user who doesnt own test returns forbidden" do
		authenticated_req :post,:create,{page:{test_id:@test.id}},Fabricate(:active_user_with_session)
		assert_equal "403",response.code
		assert_equal 1,Page.count	
	end

	test "show" do
		authenticated_req :get,:show,{id:@page.id},@user
		assert_equal "200",response.code
		assert_equal json_response["page"]["id"],@page.id	
	end

	test "show by user who doesnt own page returns forbidden" do
		authenticated_req :get,:show,{id:@page.id},Fabricate(:active_user_with_session)
		assert_equal "403",response.code
	end	

	test "destroy" do
		authenticated_req :delete,:destroy,{id:@page.id},@user
		assert_equal 0,Page.count
	end

end