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
          text question_number.formatted, {style: :bold}
        end
        number_indentation = question_number.width
      end

      y = 0
            
      block.lines.each do |line|

        lines_box = bounding_box [number_indentation,bounds.top-y],width:bounds.right do

          line.write_to_pdf self

        end

        y += lines_box.height

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