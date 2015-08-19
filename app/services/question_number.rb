class QuestionNumber
	include Prawn::View
	attr_reader :formatted,:width

	def initialize block
		@index = question_blocks_sorted(block.page.test).index(block) + 1
		@formatted = @index.to_s + ")  "
		@width = width_of @formatted
	end

	def question_blocks page
		page.blocks.order("row ASC, col ASC").select {|block| block.question?}
	end

	def question_blocks_sorted test
		ar = []
		test.pages.each do |page|
			ar.push question_blocks(page)
		end
		ar.flatten
	end

end