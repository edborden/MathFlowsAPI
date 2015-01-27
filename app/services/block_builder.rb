class BlockBuilder

	def initialize page,position_params,block_params
		@page = page
		@position_params = position_params
		@block_params = block_params
		@size_params = {row_span:@position_params[:row_span],col_span:@position_params[:col_span]}
		
		run
		return page_position
	end

	def run
		@page.child_positions<<page_position
		other_documents.each do |document|
			position = BlockPosition.create @size_params
			position.positionable = block
			document.pages.last.child_positions<<position
		end
	end

	def other_documents
		@page.document.flow.documents.where.not id:@page.document.id
	end

	def page_position
		@page_position ||= Waterfall.new.block_position @position_params,@block_params
	end

	def block
		@block ||= page_position.positionable
	end

end