require 'open-uri'
require 'data_uri/open_uri'
require 'base64'

class Image < ActiveRecord::Base

	belongs_to :block

	def initialize source
		super()

		if source[:latex]
			source[:url] = URI.encode("http://latex.codecogs.com/png.latex?\\dpi{300}" + source[:latex])
		end

		if source[:url]
			io = open source[:url]
			file = io.read
			binary = Base64.encode64 file
			self.binary = "data:image/png;base64," + binary
		end

		if source[:binary]
			self.binary = source[:binary]
		end

		self.block_id = source[:block_id]
		set_dimensions

	end

	def image?
		true
	end

	def line_width
		width * 0.25
	end

	def line_height
		height * 0.25
	end

	def split_base64(uri_str)
		if uri_str.match(%r{^data:(.*?);(.*?),(.*)$})
			uri = Hash.new
			uri[:type] = $1 # "image/gif"
			uri[:encoder] = $2 # "base64"
			uri[:data] = $3 # data string
			uri[:ext] = $1.split('/')[1] # "gif"
			return uri
		end
	end

	def set_dimensions
		size = ImageSize.new(file).size
		self.width = size[0]
		self.height = size[1]
	end

	def file
		uri = URI::Data.new binary
		open uri
	end
end
