class BlockSerializer < ApplicationSerializer
	has_many :child_positions, embed_in_root: true, each_serializer:PositionSerializer, root: "positions"
	has_one :layout, embed_in_root: true, serializer: LayoutSerializer

end