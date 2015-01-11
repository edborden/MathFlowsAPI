class LayoutSerializer < ApplicationSerializer
	attributes :rows, :cols, :page_height, :page_width

	has_many :blocks, embed_in_root: true
		
end
