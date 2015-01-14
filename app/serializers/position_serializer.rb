class PositionSerializer < ApplicationSerializer
	attributes :row,:col,:row_span,:col_span,:positionable_type
	#has_one :owner, polymorphic:true
	has_one :positionable,embed_in_root:true,polymorphic:true
end
