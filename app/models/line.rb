class Line < ActiveRecord::Base
	belongs_to :block

	after_save {block.run_invalidator}

	def processed_content
		if content.blank?
			[Snippet.new]
		else
			EquationExtractor.new(content).array
		end
	end

	def has_write_access? user
		block.user == user
	end

end