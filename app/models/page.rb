class Page < ActiveRecord::Base
	has_many :blocks, dependent: :destroy
	belongs_to :test

	validates_presence_of :test_id

	amoeba {enable}

	def has_write_access? user
		test.user == user
	end
end
