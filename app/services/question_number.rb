class QuestionNumber
	include Prawn::View
	attr_reader :formatted,:width

	def initialize position
		@index = question_positions_sorted(position.page.document).index(position) + 1
		@formatted = @index.to_s + ".  "
		@width = width_of @formatted
	end

	def question_positions page
		page.positions.order("row ASC, col ASC").select {|position| position.block.question}
	end

	def question_positions_sorted document
		ar = []
		document.pages.each do |page|
			ar.push question_positions(page)
		end
		ar.flatten
	end

end