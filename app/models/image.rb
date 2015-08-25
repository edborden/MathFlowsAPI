require 'open-uri'
require 'data_uri/open_uri'
require 'base64'

class Image < ActiveRecord::Base

	before_destroy :delete_cloudinary

	belongs_to :block
	validates_presence_of :width,:height,:cloudinary_id,:block_id

	def latex string
		string.chop!.slice! 0 #remove $
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
		@file ||= open url
	end

	def file		
		@file ||= to_file("http://res.cloudinary.com/hmb9zxcjb/image/upload/" + cloudinary_id)
	end

	def delete_cloudinary
		CloudinaryHandler.new.handle :delete_resource, cloudinary_id
	end

	def has_write_access? user
		block.user == user
	end
end
