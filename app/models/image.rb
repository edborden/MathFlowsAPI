require 'open-uri'

class Image < ActiveRecord::Base
	before_destroy :delete_cloudinary
	after_create :create_alignment
	after_save {block.run_invalidator}

	belongs_to :block
	has_one :alignment, as: :alignable, dependent: :destroy

	validates_presence_of :width,:height,:cloudinary_id,:block_id

	def file		
		@file ||= open "http://res.cloudinary.com/hmb9zxcjb/image/upload/" + cloudinary_id
	end

	def delete_cloudinary
		CloudinaryHandler.new.handle :delete_resource, cloudinary_id
	end

	def has_write_access? user
		block.user == user
	end

	def write_to_pdf pdf
		pdf.image file, width: width, height: height
	end
end
