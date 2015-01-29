class BlockBuilder

	def initialize page,position_params,block_params
		@page = page
		@position_params = position_params
		@block_params = block_params
		@size_params = {row_span:@position_params[:row_span],col_span:@position_params[:col_span]}
		
		run
	end

	def run
		@page.child_positions<<block_position
		other_documents.each do |document|
			position = BlockPosition.create @size_params
			position.positionable = block
			document.pages.last.child_positions<<position
		end
	end

	def other_documents
		@page.document.flow.documents.where.not id:@page.document.id
	end

	def block_position_mold
		if @block_params[:question]
			MasterMold.new.block_position_question @position_params
		else
			MasterMold.new.block_position_directions @position_params
		end
	end

	def block_position
		@block_position ||= Waterfall.new.block_position block_position_mold
	end

	def block
		@block ||= block_position.positionable
	end

end