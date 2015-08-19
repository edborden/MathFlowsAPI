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

							## PROCESS CONTENT LINES
							element_width = bounds.right
							content_lines = []
							unused_content = line.processed_content
							until unused_content.empty?
								content_line = ContentLine.new(unused_content,element_width)
								content_lines << content_line
								unused_content = content_line.unused_content_array
							end

							## EACH LINE
							content_lines.each do |content_line|
								bounding_box [0,bounds.top - total_content_height],width:bounds.right, height:content_line.height do				
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
								total_content_height += content_line.height
							end

						end

					end

				end

			end

			## BLOCK IMAGE

			if block.image.present?
				image block.image.file, fit: [bounds.right,bounds.top - total_content_height], position: :right, vposition: :bottom
			end

			stroke_bounds if block.question? && borders

		end

	end

end