class BlockSerializer < ApplicationSerializer
	attributes :type
	has_many :child_positions, embed_in_root: true, each_serializer:PositionSerializer
	has_one :layout, embed_in_root: true, serializer: LayoutSerializer

	def type
		object.class.name
	end
end
