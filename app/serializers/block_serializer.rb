class BlockSerializer < ApplicationSerializer
	has_many :positions
	has_many :child_positions, embed_in_root: true, each_serializer:PositionSerializer
		
end
