class Line < ActiveRecord::Base
	include ProcessedContent

	belongs_to :block

	def has_write_access? user
		block.user == user
	end

end