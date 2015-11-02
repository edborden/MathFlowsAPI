module PdfHelpers

  def write_block block,borders=false
    pdf_block block,block.height,borders
  end

  def write_stretchy_block block
    pdf_block block,nil
  end

  def pdf_block block,block_height,borders=false

    bounding_box([block.x, bounds.top - block.y], width: block.width,height:block_height) do

      ## BLOCK QUESTION NUMBER

      number_indentation = 0
      if block.question?
        move_down 3.5
        question_number = QuestionNumber.new(block)
        float do
          text question_number.string, {style: :bold}
        end
        number_indentation = question_number.width
      end

      y = 0

      indent number_indentation do
        lines_group = LinesGroup.new(block.lines,bounds.right)
        y += lines_group.write_to_pdf(self).height
      end

      ## BLOCK CHILDREN

      children_box = bounding_box [0,bounds.top-y],width:bounds.right do

        block.write_to_pdf(self)

      end

      ## QUESTION BLOCK BORDERS

      stroke_bounds if block.question? && borders

    end

  end

end