require 'open-uri'
require 'base64'

class Image < ActiveRecord::Base

	belongs_to :imageable, polymorphic:true

	def initialize source
		super()
		if source[:data]
			@data = source[:data]
			self.data = @data
		end

		if source[:url]
			io = open source[:url]
			file = io.read
			binary = Base64.encode64 file
			self.data = "data:image/png;base64," + binary
		end

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

	def file
		uri = URI::Data.new data
		open uri
	end

end