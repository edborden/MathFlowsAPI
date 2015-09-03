class Line < ActiveRecord::Base
	include ProcessedContent

	belongs_to :block

	#after_save {block.run_invalidator}

	def has_write_access? user
		block.user == user
	end

end