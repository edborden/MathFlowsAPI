class LineSerializer < ApplicationSerializer
	attributes :content,:position
	has_one :block
end
