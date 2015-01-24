class PositionSerializer < ApplicationSerializer
	attributes :row,:col,:row_span,:col_span
	
	has_one :block,embed_in_root:true
	has_one :page

	def block
		object.positionable
	end

	def page
		object.owner
	end
end
