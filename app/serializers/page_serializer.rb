class PageSerializer < ApplicationSerializer
	has_many :child_positions, embed_in_root: true, each_serializer:PositionSerializer
	has_one :document
end