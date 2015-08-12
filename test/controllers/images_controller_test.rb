require 'test_helper'

class ImagesControllerTest < ActionController::TestCase

	def setup
		user_with_block
	end

	test "create" do
		authenticated_req :post,:create,{image:{cloudinary_id:"test",block_id:@block.id}},@user
		assert_equal 1,Image.count
	end

	test "create by user who doesnt own block returns forbidden" do
		authenticated_req :post,:create,{image:{cloudinary_id:"test",block_id:@block.id}}, Fabricate(:active_user_with_session)
		assert_equal "403",response.code
		assert_equal 0,Image.count	
	end

	test "destroy" do
		image = Image.create cloudinary_id:"test",block_id:@block.id
		authenticated_req :delete,:destroy,{id:image.id},@user
		assert_equal 0,Image.count
	end

	test "destroy by user who doesnt own block returns forbidden" do
		image = Image.create cloudinary_id:"test",block_id:@block.id
		other_user = Fabricate :active_user_with_session
		authenticated_req :delete,:destroy,{id:image.id},other_user
		assert_equal "403",response.code
	end

end