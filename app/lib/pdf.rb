require 'data_uri'
require 'open-uri'
require 'data_uri/open_uri'

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
						content_padding = 0
						if block.question
							question_number = QuestionNumber.new(position).formatted
							float do
								text question_number
							end
							content_padding = width_of question_number
						end

						indent content_padding do
							processed_content = EquationExtractor.new(block.content)
							if processed_content.contains_equations?
								processed_content.array.each do |content|
									if content.is_a? Image
										image content.file, scale:0.25
									else
										text content
									end
								end
							else
								text block.content
							end
						end
					end

					if block.images.exists?
						image block.images.first.file, fit: [bounds.right,bounds.top - content_box.height], position: :right, vposition: :bottom
					end


						
						#if snippet.has_equation
						#	image snippet.equation.image.file, fit: [snippet_position.width(block_position),snippet_position.height]
						#elsif snippet.has_image
						#	image snippet.image.file, fit: [snippet_position.width(block_position),snippet_position.height]


				end
			end
		end
	end

end