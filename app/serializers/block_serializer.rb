class BlockSerializer < ApplicationSerializer
	attributes :row, :col, :height, :width, :content
	has_one :grid
		
end
