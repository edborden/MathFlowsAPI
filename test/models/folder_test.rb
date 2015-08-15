require 'test_helper'

class FolderTest < ActiveSupport::TestCase

	def setup
		user_with_block
	end

	test "if user is deleted, folder is deleted" do
		@user.destroy
		assert_equal 0,Folder.count
	end

	test "folder user_id cannot be null" do
		assert_raises_invalid {Folder.create}
	end

end