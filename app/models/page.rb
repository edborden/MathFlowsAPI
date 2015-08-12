class Page < ActiveRecord::Base
	has_many :blocks
	belongs_to :test

	amoeba do
		enable
	end

	def has_write_access? user
		test.user == user
	end
end
