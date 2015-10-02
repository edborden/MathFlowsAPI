class ContentLine
	attr_reader :unused_content_array,:line_items,:height,:width

	##TAKES AN ARRAY OF CONTENT, SPITS OUT ARRAY OF CONTENT IT DIDN'T USE
	def initialize unused_content_array,element_width,styles
		@width = element_width
		@unused_content_array = unused_content_array
		@styles = styles
		@line_items = []
		unconsolidated_line_items = []
		line_width = 0
		@unused_content_array.each do |item|
			line_width += item.width
			unconsolidated_line_items << item
			break if line_width > @width
		end

		@unused_content_array -= unconsolidated_line_items

		#handler for when last content item is too long
		if line_width > @width
			if unconsolidated_line_items.size > 1 
				@unused_content_array.unshift unconsolidated_line_items.pop
			else
				puts "NEED TO HANDLE ITEMS THAT HAVE WIDTHS GREATER THAN BLOCK WIDTH"
			end
		end

		# snippet joiner
		snippet_string = ""
		unconsolidated_line_items.each do |item|
			if item.is_a? Equation
				if snippet_string.length > 0
					@line_items.push Snippet.new(snippet_string,@styles)
					snippet_string = ""	
				end			
				@line_items.push item
				@line_items.push Snippet.new
			elsif item.is_a? Snippet
				snippet_string += item.string
			else
				@line_items.push item
			end
		end
		if snippet_string.length > 0
			@line_items.push Snippet.new(snippet_string,@styles)
		end	

		p @line_items
		format_line_items
		set_height
	end

	def format_line_items

		line_items = []

		# Left aligned

		left_aligned_items = @line_items.select { |item| item.alignment.left? }
		left_space = 0
		
		left_aligned_items.each do |item|
			line_items << OpenStruct.new(indentation:left_space,object:item,width:item.width,height:item.height)
			left_space += item.width
		end

		# Right aligned

		right_aligned_items = @line_items.select { |item| item.alignment.right? }
		right_space = 0

		right_aligned_items.each do |item|
			line_items << OpenStruct.new(indentation:@width-item.width-right_space,object:item,width:item.width,height:item.height)
			right_space += item.width
		end	

		# Center aligned

		center_aligned_items = @line_items.select { |item| item.alignment.center? }
		total_center_items_width = center_aligned_items.map(&:width).sum
		available_center_space = @width-left_space-right_space
		indentation = (available_center_space-total_center_items_width)/2
		indentation += left_space

		center_aligned_items.each do |item|
			line_items << OpenStruct.new(indentation:indentation,object:item,width:item.width,height:item.height)
			indentation += item.width
		end	

		@line_items = line_items

	end

	def set_height
		@height = 0
		@line_items.each do |item|
			@height = item.object.height if item.object.height > @height
		end
		@height += 4 if @height > 18# allow for 2px buffer on top and bottom for images
	end

	def write_to_pdf pdf
		pdf.bounding_box [2,pdf.bounds.top],width:@width, height:@height do				
			@line_items.each do |item|
				pdf.float do
					pdf.bounding_box [item.indentation,pdf.bounds.top], width: item.width,height:pdf.bounds.top do
						item.object.write_to_pdf(pdf)
					end
				end
			end
		end
	end

end