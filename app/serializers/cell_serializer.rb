class CellSerializer < ApplicationSerializer
	attributes :content
	has_one :row
	has_one :col
end
