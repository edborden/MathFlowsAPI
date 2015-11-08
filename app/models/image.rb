require 'open-uri'

class Image < ActiveRecord::Base
  include NormalizeImage

  after_create :create_alignment, unless: :alignment

  belongs_to :block
  has_one :alignment, as: :alignable, dependent: :destroy

  validates_presence_of :width,:height,:cloudinary_id,:block_position #:block_id
  
  amoeba {enable}

  def file    
    @file ||= open "http://res.cloudinary.com/hmb9zxcjb/image/upload/" + cloudinary_id
  end

  def has_write_access? user
    block.user_id == user.id
  end

  def write_to_pdf pdf
    filetype = file.meta["content-type"]
    image_for_prawn = if file.is_a? Tempfile #over 10kb
      fileimage(file.path)
    else #StringIO
      base64image(filetype,file.read)
    end
    pdf.image image_for_prawn, width: width, height: height
  end
end