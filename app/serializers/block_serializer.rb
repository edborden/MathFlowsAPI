class BlockSerializer < ApplicationSerializer
	attributes :row, :col, :height, :width, :content
	has_one :layout
		
end
