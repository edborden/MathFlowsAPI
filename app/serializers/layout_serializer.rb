class LayoutSerializer < ApplicationSerializer

	has_many :blocks, embed_in_root: true
		
end
