class Preference < ActiveRecord::Base
	belongs_to :user

	def has_write_access? test_user
		test_user == user
	end
end