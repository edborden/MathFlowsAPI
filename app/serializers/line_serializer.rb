class LineSerializer < ApplicationSerializer
	attributes :content,:position
	has_one :block, embed: :ids, include: :true, serializer:BlockWithoutLinesSerializer, root: "blocks"
end
