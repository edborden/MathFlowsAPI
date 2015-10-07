module ProcessedContent

  def processed_content
    if content.blank?
      [Snippet.new]
    else
      EquationExtractor.new(content,try(:styles)).array
    end
  end

  def processed_content_lines element_width
    content_lines = []
    unused_content = processed_content
    until unused_content.empty?
      content_line = ContentLine.new(unused_content,element_width,try(:styles))
      content_lines << content_line
      unused_content = content_line.unused_content_array
    end
    return content_lines
  end

  def write_to_pdf pdf

    y = 0

    content_lines = processed_content_lines pdf.bounds.right

    content_lines.each do |content_line|
      content_line_box = pdf.bounding_box [ 0, pdf.bounds.top - y ], width: pdf.bounds.right, height: content_line.height do
        content_line.write_to_pdf pdf
      end
      y += content_line_box.height
    end
  end

end