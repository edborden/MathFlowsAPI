class BlockBuilder

	def initialize page,position_params
		@page = page
		@position_params = position_params
		@size_params = position_params.except :col,:row
		
		run
	end

	def run
		@page.positions<<position
		other_documents.each do |document|
			position = Position.create @size_params
			position.block = block
			document.pages.last.positions<<position
		end
	end

	def other_documents
		@page.document.flow.documents.where.not id:@page.document.id
	end

	def position
		@position ||= Waterfall.new.position({params:@position_params,block:MasterMold.new.default_block})
	end

	def block
		@block ||= position.block
	end

end