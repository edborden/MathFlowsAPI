class Pdf
	include Prawn::View

	def initialize document
		#super()
		@doc = document
		generate_pdf
	end

	def generate_pdf

		first_page = true
	
		@doc.pages.each do |page|

			if first_page
				first_page = false
			else
				start_new_page
			end

			page.positions.each do |position|

				bounding_box([position.x, bounds.top - position.y], width: position.width, height:position.height) do
					
					block = position.block

					content_box = bounding_box([0,bounds.top],width:bounds.right) do

						## BLOCK QUESTION NUMBER

						number_indentation = 0
						if block.question
							question_number = QuestionNumber.new(position)
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
											if item[:item].try :image?
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
								text block.content
							end
						end

					end

					## BLOCK IMAGE

					if block.images.exists?
						image block.images.first.file, fit: [bounds.right,bounds.top - content_box.height], position: :right, vposition: :bottom
					end

				end
			end
		end
	end

end