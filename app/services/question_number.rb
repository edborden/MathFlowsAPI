class QuestionNumber
	include Prawn::View
	attr_reader :formatted,:width

	def initialize block
		page = block.page
		test = page.try :test
		if page && test
			@index = question_blocks_sorted(block.test).index(block) + 1
		else
			@index = 0
		end
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