require "prawn/measurement_extensions"
require 'data_uri'
require 'open-uri'
require 'data_uri/open_uri'

class Pdf
	include Prawn::View

	def initialize layout
		@layout = layout
		generate_pdf
	end

	def generate_pdf
		define_grid columns:4, rows:8, gutter: 0.16.send(:in)
		@layout.blocks.each do |block|
			if block.sized?
				box = grid([block.pdf_row,block.pdf_col],bounding_box(block))
			else
				box = grid(block.pdf_row,block.pdf_col)
			end
			box.bounding_box do
				block.snippets.each do |snippet|
					if snippet.has_equation
						float {image(snippet.equation.image.file,scale:0.65) }
					else
						float {text(snippet.content)}
					end
				end
			end
		end
	end

	def bounding_box block
		if block.has_width?
			col = block.pdf_col + (block.width - 1)
		else
			col = block.pdf_col
		end

		if block.has_height?
			row = block.pdf_row + (block.height - 1)
		else
			row = block.pdf_row
		end
		[row,col]
	end

end