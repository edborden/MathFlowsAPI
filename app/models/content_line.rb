class ContentLine
	include Prawn::View
	attr_reader :line_items,:height,:unused_content_array

	##TAKES AN ARRAY OF CONTENT, SPITS OUT ARRAY OF CONTENT IT DIDN'T USE
	def initialize unused_content_array,element_width
		@unused_content_array = unused_content_array
		@line_items = []
		line_width = 0
		@unused_content_array.each do |item|
			line_width = line_width + item.width
			line_items << item
			break if line_width > element_width
		end

		@unused_content_array -= @line_items

		#handler for when last content item is too long
		if line_width > element_width
			if @line_items.size > 1 
				@unused_content_array.unshift @line_items.pop
			else
				puts "NEED TO HANDLE ITEMS THAT HAVE WIDTHS GREATER THAN BLOCK WIDTH"
			end
		end

		format_line_items
		set_height
	end

	def format_line_items
		cursor = 0
		@line_items.each_with_index do |item,index|
			@line_items[index] = OpenStruct.new indentation:cursor,object:item
			cursor += item.width
		end
	end

	def set_height
		@height = 0
		@line_items.each do |item|
			@height = item.object.height if item.object.height > @height
		end
		@height += 4 if @height > 18# allow for 2px buffer on top and bottom for images
	end

end