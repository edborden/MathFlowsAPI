class Pdf
	include Prawn::View
	include PdfHelpers

	def initialize test
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

			page.blocks.each { |block| write_block(block) }

		end
	end

end