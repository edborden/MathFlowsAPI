module PdfHelpers

	def write_block block,borders=false
		pdf_block block,block.height,borders
	end

	def write_stretchy_block block
		pdf_block block,nil
	end

	def pdf_block block,block_height,borders=false

		bounding_box([block.x, bounds.top - block.y], width: block.width,height:block_height) do

			block_top_offset = 0
						
			lines_box = bounding_box([0,bounds.top],width:bounds.right) do

				y = 0

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

						y += write_line(line,y)

					end

				end

			end

			block_top_offset += lines_box.height

			## BLOCK IMAGE

			if block.image.present?
				image block.image.file, fit: [bounds.right,bounds.top - block_top_offset], position: :right, vposition: :bottom
			end

			## BLOCK TABLE

			table = block.table
			if table.present?

				table_box = bounding_box( [0, bounds.top - block_top_offset], width:bounds.right ) do

					y = 0

					table.rows.each do |row|

						x = 0

						row_box = bounding_box([0,bounds.top - y], width: bounds.right ) do

							table.cols.each do |col|

								bounding_box([x,bounds.top],width:col.size) do

									cell = table.cell_at(row,col) || Cell.new(row_id:row.id,col_id:col.id)
									write_line cell, 0

								end

								x += col.size

							end

						end

						p row_box.height

						stroke { rectangle [0,bounds.top-y],x,row_box.height }

						y += row_box.height

					end 

				end
					
				#stroke each col
				x = 0
				table.cols.each do |col|
					x += col.size
					stroke { vertical_line bounds.top - block_top_offset, bounds.top - table_box.height - block_top_offset, at: x }
				end

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

	def write_content_line content_line, y, element_width
		bounding_box [2,y],width:element_width, height:content_line.height do				
			content_line.line_items.each do |item|
				float do
					## RENDER TO PDF
					if item[:item].is_a? Image
						image item[:item].file, scale:0.25, position: item[:indentation], vposition: 2
					else
						indent item[:indentation] do
							text item[:item].text, valign: :center
						end
					end
				end
			end
		end
	end

	def write_line line, top_offset
		y = 0
		content_lines = process_content_lines bounds.right, line.processed_content

		content_lines.each do |content_line|
			write_content_line content_line, bounds.top - top_offset - y, bounds.right
			y += content_line.height
		end
		return y
	end

end