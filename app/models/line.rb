class Line < ActiveRecord::Base
	belongs_to :block

	after_commit {block.run_invalidator}

	def processed_content
		if content.blank?
			[Snippet.new]
		else
			EquationExtractor.new(content).array
		end
	end

end