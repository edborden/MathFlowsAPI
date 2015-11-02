class LinesGroup
  include Prawn::View
  attr_accessor :width

  def initialize lines,width
    @lines = lines
    @width = width
  end

  def write_to_pdf pdf

    lines_group_box = pdf.bounding_box [ 0, pdf.bounds.top ], width: @width do

      y = 0

      @lines.each do |line|

        lines_box = pdf.bounding_box [0,pdf.bounds.top-y],width:pdf.bounds.right do

          line.write_to_pdf pdf

        end

        y += lines_box.height

      end

    end

  end

  def alignment
    @alignment ||= OpenStruct.new side: "left", left?:true
  end

  def height
    @height ||= write_to_pdf(self).height
  end

end