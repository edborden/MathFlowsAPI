module PdfHelpers

  def write_block block,borders=false
    pdf_block block,block.height,borders
  end

  def write_stretchy_block block
    pdf_block block,nil
  end

  def pdf_block block,block_height,borders=false

    p bounds.top,block.y,block.row,block.col
    bounding_box [block.x, bounds.top - block.y], width: block.width,height:block_height do

      block.write_to_pdf(self)

      ## QUESTION BLOCK BORDERS

      stroke_bounds if block.question? && borders

    end

  end

end