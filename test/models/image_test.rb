require 'test_helper'

class ImageTest < ActiveSupport::TestCase

	test "cannot create without block_id" do
		assert_raises_invalid {Image.create cloudinary_id:"test"}
	end

	test "cannot create without cloudinary_id" do
		user_with_block
		assert_raises_invalid {Image.create block_id:@block.id}
	end

	test "is destroyed when block is destroyed" do
		user_with_block
		Image.create block_id:@block.id,cloudinary_id:'test'
		assert_equal 1,Image.count
		@block.destroy
		assert_equal 0,Image.count
	end

end