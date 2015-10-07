class Validate
  include Prawn::View
  include PdfHelpers  

  def initialize block

    @block = block

    @block.content_invalid = content_invalid?
    @block.save

  end

  def content_invalid?
    actual_height > @block.height
  end

  def actual_height
    @actual_height ||= write_stretchy_block(@block).height
  end

end