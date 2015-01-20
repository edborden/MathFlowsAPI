class BlockSerializer < PositionableSerializer
	attributes :width,:height,:col_width
	has_many :snippets, embed_in_root: true

	def snippets
		object.positionables
	end

end