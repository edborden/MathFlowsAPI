class BlockSerializer < PositionableSerializer

	has_many :snippets, embed_in_root: true
	has_one :layout, embed_in_root: true, serializer: LayoutSerializer

	def snippets
		object.positionables
	end

end