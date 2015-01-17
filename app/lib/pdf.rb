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
	
		@doc.pages.each do |page|
			page.child_positions.each do |block_position|
				bounding_box([block_position.x, bounds.top - block_position.y], width: block_position.positionable.layout.width, height:block_position.positionable.layout.height) do
					text bounds.top.to_s
					stroke_bounds
					block_position.positionable.child_positions.each do |snippet_position|

						bounding_box([snippet_position.x, bounds.top - snippet_position.y], width: snippet_position.positionable.width, height:snippet_position.positionable.height) do
							snippet = snippet_position.positionable
							if snippet.has_equation
								image(snippet.equation.image.file,scale:0.75)
							else
								text(snippet.content)
							end

						end

					end

				end

			#add_another_page

			end

		end
		
	end

end