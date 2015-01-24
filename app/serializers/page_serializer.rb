class PageSerializer < ApplicationSerializer
	has_one :document
	has_one :layout
	has_many :positions, embed_in_root: true, each_serializer: PositionSerializer

	def positions
		object.child_positions
	end

end
