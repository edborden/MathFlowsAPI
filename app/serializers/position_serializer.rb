class PositionSerializer < ApplicationSerializer
	attributes :row,:col,:width,:height
	has_one :owner, polymorphic:true
	has_one :positionable,embed_in_root:true,polymorphic:true
end
