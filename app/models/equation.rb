require 'open-uri'

class Equation
	attr_reader :file,:width,:height

	def initialize latex
		latex.chop!.slice! 0 #remove $
		@latex = latex
		set_dimensions
	end

	def url
		@url ||= URI.encode("http://latex.codecogs.com/png.latex?\\dpi{300}" + @latex)
	end	

	def set_dimensions
		size = ImageSize.new(file).size
		@width = size[0] * 0.25
		@height = size[1] * 0.25
	end	

	def alignment
		OpenStruct.new side: "left", left?:true
	end

	def write_to_pdf pdf
		pdf.image file, vposition: 2, scale: 0.25
	end

	def file
		@file ||= open url
	end

end