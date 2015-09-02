module PdfHelpers

	def write_block block,borders=false
		pdf_block block,block.height,borders
	end

	def write_stretchy_block block
		pdf_block block,nil
	end

	def pdf_block block,block_height,borders=false

		bounding_box([block.x, bounds.top - block.y], width: block.width,height:block_height) do

			total_content_height = 0

			indent 2 do # when borders=true, need some space
						
				content_box = bounding_box([0,bounds.top],width:bounds.right) do

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

					indent number_indentation do

						## BLOCK LINES

						block.lines.each do |line|

							total_content_height = write_line(line,total_content_height)

						end

					end

				end

			end

			## BLOCK IMAGE

			if block.image.present?
				image block.image.file, fit: [bounds.right,bounds.top - total_content_height], position: :right, vposition: :bottom
			end

			## QUESTION BLOCK BORDERS

			stroke_bounds if block.question? && borders

		end

	end

	def process_content_lines element_width, unused_content
		content_lines = []
		until unused_content.empty?
			content_line = ContentLine.new(unused_content,element_width)
			content_lines << content_line
			unused_content = content_line.unused_content_array
		end
		return content_lines
	end

	def write_content_line content_line, element_height, total_content_height, element_width
		bounding_box [0,element_height - total_content_height],width:element_width, height:content_line.height do				
			content_line.line_items.each do |item|
				float do
					## RENDER TO PDF
					if item[:item].is_a? Image
						image item[:item].file, scale:0.25, position: item[:indentation]
					else
						indent item[:indentation] do
							text item[:item].text, valign: :center
						end
					end
				end
			end
		end
	end

	def write_line line, total_content_height
		content_lines = process_content_lines bounds.right, line.processed_content

		content_lines.each do |content_line|
			write_content_line content_line, bounds.top, total_content_height, bounds.right
			total_content_height += content_line.height
		end
		return total_content_height
	end

end