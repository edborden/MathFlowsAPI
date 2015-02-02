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

				bounding_box([block_position.x, bounds.top - block_position.y], width: block_position.width, height:block_position.height) do
					
					block_position.positionable.child_positions.each do |snippet_position|

						bounding_box([snippet_position.x(block_position), bounds.top - snippet_position.y], width: snippet_position.width(block_position), height:snippet_position.height) do
							
							snippet = snippet_position.positionable
							if snippet.has_equation
								image snippet.equation.image.file, fit: [snippet_position.width(block_position),snippet_position.height]
							elsif snippet.has_image
								image snippet.image.file, fit: [snippet_position.width(block_position),snippet_position.height]
							elsif snippet.question_number and block_position.positionable.question
								text QuestionNumber.new(snippet,@doc).formatted
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