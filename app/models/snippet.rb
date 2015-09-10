class Snippet
	include Prawn::View

	def initialize text=nil
		if text
			@text = clean text
		end
	end

	def width
		@text ? width_of(@text) : 5
	end

	def height
		18
	end

	def text
		@text ? @text : Prawn::Text::NBSP
	end

	def clean string
		string.gsub "\\$","$"
	end

	def set_text string
		@text = string
	end

end