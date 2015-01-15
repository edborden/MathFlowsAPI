class PageSerializer < ApplicationSerializer
	has_many :child_positions, embed_in_root: true, each_serializer:PositionSerializer, root:'positions'
	has_one :document
	has_one :layout
end
