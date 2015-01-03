class BlockSerializer < ApplicationSerializer
	attributes :row, :col, :height, :width
	has_one :layout
	has_many :snippets, embed_in_root: true
		
end
