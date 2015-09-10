require 'open-uri'

class Equation

	attr_reader :file,:width,:height

	def initialize latex
		latex.chop!.slice! 0 #remove $
		url = URI.encode("http://latex.codecogs.com/png.latex?\\dpi{300}" + latex)
		@file = open url
		set_dimensions
	end

	def line_width
		width * 0.25
	end

	def line_height
		height * 0.25
	end

	def set_dimensions
		size = ImageSize.new(file).size
		@width = size[0]
		@height = size[1]
	end

end