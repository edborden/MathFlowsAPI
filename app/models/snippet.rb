class Snippet
	include Prawn::View

	def initialize text=nil
		@text = text
	end

	def line_width
		if @text
			width_of @text
		else
			5
		end
	end

	def line_height
		18
	end

	def text
		if @text
			@text
		else
			Prawn::Text::NBSP
		end
	end

end