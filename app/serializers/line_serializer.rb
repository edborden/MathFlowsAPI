class LineSerializer < ApplicationSerializer
	attributes :content
	has_one :block, embed: :ids, include: :true
end
