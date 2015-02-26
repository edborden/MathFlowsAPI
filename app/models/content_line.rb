class ContentLine
	include Prawn::View
	attr_reader :line_items,:height,:unused_content_array

	##TAKES AN ARRAY OF CONTENT, SPITS OUT ARRAY OF CONTENT IT DIDN'T USE
	def initialize unused_content_array,element_width
		@unused_content_array = unused_content_array
		@line_items = []
		line_width = 0
		@unused_content_array.each do |item|
			line_width = line_width + item.line_width
			line_items << item
			break if line_width > element_width
		end

		@unused_content_array -= @line_items

		#handler for when last content item is too long
		if line_width > element_width
			last_item = @line_items.last
			available_width = element_width - (line_width - last_item.line_width)
			if last_item.try(:image?) || available_width < 10
				##drop image to use on next line
				@unused_content_array << @line_items.pop
			else
				##remove truncated text
				
				truncated_text = text_box last_item.text,{width:available_width,overflow: :truncate}
				@unused_content_array.unshift Snippet.new(truncated_text)
				last_item.text = last_item.text.delete truncated_text
			end
		end
		format_line_items
		set_height
	end

	def format_line_items
		cursor = 0
		@line_items.each_with_index do |item,index|
			@line_items[index] = {indentation: cursor,item:item}
			cursor += item.line_width
		end
	end

	def set_height
		@height = 0
		@line_items.each do |item|
			@height = item[:item].line_height if item[:item].line_height > @height
		end
	end

end