class Pdf
	include Prawn::View

	def initialize test
		#super()
		@test = test
		generate_pdf
	end

	def generate_pdf

		first_page = true
	
		@test.pages.each do |page|

			if first_page
				first_page = false
			else
				start_new_page
			end

			page.blocks.each do |block|

				bounding_box([block.x, bounds.top - block.y], width: block.width, height:block.height) do
					
					content_box = bounding_box([0,bounds.top],width:bounds.right) do

						## BLOCK QUESTION NUMBER

						number_indentation = 0
						if block.question
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
								content_lines.each do |content_line|
									content_line.line_items.each do |item|
										float do										
											## RENDER TO PDF
											if item[:item].is_a? Image
												image item[:item].file, scale:0.25, position: item[:indentation]
											else
												indent item[:indentation] do
													text item[:item].text, height:content_line.height
												end
											end										
										end
									end
									move_down content_line.height
								end

							## JUST TEXT
							else
								text block.content.gsub "\\$","$"
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
	end

end