require 'open-uri'
require 'data_uri/open_uri'
require 'base64'

class Image < ActiveRecord::Base

	belongs_to :block

	def latex string
		url = URI.encode("http://latex.codecogs.com/png.latex?\\dpi{300}" + string)
		to_file url
		set_dimensions
		return self
	end

	def line_width
		width * 0.25
	end

	def line_height
		height * 0.25
	end

	def set_dimensions
		size = ImageSize.new(file).size
		self.width = size[0]
		self.height = size[1]
	end

	def to_file url
		#puts url
		@file = open url
		#@file = io.read
		#puts @file
	end

	def file
		unless @file
			to_file ("http://res.cloudinary.com/hmb9zxcjb/image/upload/" + cloudinary_id)
		end
		@file
	end
end
