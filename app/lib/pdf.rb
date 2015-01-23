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

			page.child_positions.each do |block_position|

				bounding_box([block_position.x, bounds.top - block_position.y], width: block_position.positionable.width, height:block_position.positionable.height) do
					
					block_position.positionable.child_positions.each do |snippet_position|

						bounding_box([snippet_position.x, bounds.top - snippet_position.y], width: snippet_position.positionable.width, height:snippet_position.positionable.height) do
							
							snippet = snippet_position.positionable
							if snippet.has_equation
								image snippet.equation.image.file,scale:0.75
							elsif snippet.has_image
								image snippet.image.file, fit: [snippet.width,snippet.height]
							elsif snippet.question_number
								text snippet.formatted_question_number(page)
							else
								text snippet.content
							end

						end
					end
				end
			end
		end
	end

end