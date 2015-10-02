class Snippet
	include Prawn::View

	def initialize string=nil,styles=nil
		@styles = styles
		if string
			@string = clean string
		end
	end

	def width
		@width ||= begin
			if @string
				width = width_of(pdf_string,inline_format:true).round
				width += 5 if ends_in_space?
				width
			else
				5
			end
		end
	end

	def height
		18
	end

	def string
		@string ? @string : " "
	end

	def pdf_string
		@string ? apply_styles(@string) : Prawn::Text::NBSP
	end

	def clean string
		string.gsub "\\$","$"
	end

	def ends_in_space?
		@string[@string.length-1] == " "
	end

	def alignment
		OpenStruct.new side: "left", left?:true
	end

	def apply_styles string
		@styles.each { |style| string = style.open_tag + string + style.close_tag }
		return string
	end

	def write_to_pdf pdf
		pdf.text pdf_string, valign: :center, inline_format:true
	end

end