class PageSerializer < ApplicationSerializer
	has_one :document
	has_many :positions, embed_in_root: true, each_serializer: PositionSerializer
	has_one :layout, embed_in_root:true

	def positions
		object.child_positions
	end

end
