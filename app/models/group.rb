class Group < ActiveRecord::Base
	has_many :users

	def has_write_access? user
		users.include? user
	end
end
