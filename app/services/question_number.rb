class QuestionNumber

	def initialize snippet, document
		@index = question_blocks_sorted(document).index(snippet.position.owner) + 1
	end

	def formatted
		@index.to_s + "."
	end

	def question_blocks page
		page.positionables.where(question:true).order("row ASC, col ASC")
	end

	def question_blocks_sorted document
		ar = []
		document.pages.each do |page|
			ar.push question_blocks(page)
		end
		ar.flatten
	end

end