class Invalidator
	include Prawn::View
	include PdfHelpers	

	def initialize block

		@block = block
		@content_invalidation = @block.content_invalidation
		@position_invalidation = @block.position_invalidation

	end

	def run
		invalidate_content
		invalidate_position
		return actual_height
	end

	def invalidate_content

		puts actual_height
		puts @block.height
		if actual_height > @block.height #+ 10 #ADDING 5 is a temporary fix for one-line content not fitting

			unless @content_invalidation.present?

				Invalidation.create block_id:@block.id,message:0

			end

		else
			
			if @content_invalidation.present?

				@content_invalidation.destroy

			end

		end

	end

	def invalidate_position

		max_rows = 26

		if @block.row + (@block.row_span - 1) > max_rows

			unless @position_invalidation.present?

				Invalidation.create block_id:@block.id,message:1

			end

		else

			if @position_invalidation.present?

				@position_invalidation.destroy
				
			end

		end

	end

	def actual_height
		@actual_height ||= write_stretchy_block(@block).height
	end

end