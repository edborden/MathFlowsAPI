class LineSerializer < ApplicationSerializer
	attributes :content
	has_one :block,embed_in_root:true
end
