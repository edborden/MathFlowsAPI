require 'test_helper'

class PreferenceTest < ActiveSupport::TestCase

	test "preference cannot be created without user_id" do
		assert_raises_invalid {Preference.create}
	end

	test "preference is destroyed when user is destroyed" do
		user = User.create
		assert_equal 1,Preference.count
		user.destroy
		assert_equal 0,Preference.count
	end

end