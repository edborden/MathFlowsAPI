class Snippet
	include Prawn::View

	def initialize string=nil,styles=nil
		@styles = styles
		if string
			@string = clean string
			apply_styles
		end
	end

	def width
		@width ||= @string ? width_of(@string,inline_format:true).round+3 : 5
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

	def apply_styles
		@styles.each { |style| @string = style.open_tag + @string + style.close_tag }
	end

	def write_to_pdf pdf
		pdf.text string, valign: :center, inline_format:true
	end

end