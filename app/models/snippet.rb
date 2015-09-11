class Snippet
	include Prawn::View

	def initialize string=nil
		if string
			@string = clean string
		end
	end

	def width
		@string ? width_of(@string) : 5
	end

	def height
		18
	end

	def string
		@string ? @string : Prawn::Text::NBSP
	end

	def clean string
		string.gsub "\\$","$"
	end

	def alignment
		OpenStruct.new side: "left", left?:true
	end

	def write_to_pdf pdf
		pdf.text string, valign: :center
	end

end