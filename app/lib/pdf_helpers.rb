module PdfHelpers

	def write_block block
		pdf_block block,block.height
	end

	def write_stretchy_block block
		pdf_block block,nil
	end

	def pdf_block block,block_height

		bounding_box([block.x, bounds.top - block.y], width: block.width, height:block_height) do
					
			content_box = bounding_box([0,bounds.top],width:bounds.right) do

				## BLOCK QUESTION NUMBER

				number_indentation = 0
				if block.question
					move_down 4
					question_number = QuestionNumber.new(block)
					float do
						text question_number.formatted
					end
					number_indentation = question_number.width
				end

				## BLOCK CONTENT

				indent number_indentation do

					## PROCESS CONTENT
					processed_content = EquationExtractor.new(block.content)

					## CONTENT WITH EQUATIONS
					if processed_content.contains_equations?

						## PROCESS CONTENT LINES
						element_width = bounds.right
						content_lines = []
						unused_content = processed_content.array
						until unused_content.empty?
							content_line = ContentLine.new(unused_content,element_width)
							content_lines << content_line
							unused_content = content_line.unused_content_array
						end

						## EACH LINE
						last_height = 0
						content_lines.each do |content_line|
							bounding_box [0,bounds.top - last_height],width:bounds.right, height:content_line.height do				
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
							last_height += content_line.height
						end

					## JUST TEXT
					else
						content = block.content.gsub "\\$","$"
						text content, leading: 5
					end
				end

			end

			## BLOCK IMAGE

			if block.image.present?
				image block.image.file, fit: [bounds.right,bounds.top - content_box.height], position: :right, vposition: :bottom
			end

		end

	end

end