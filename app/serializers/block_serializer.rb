class BlockSerializer < ApplicationSerializer
	attributes :width,:height,:col_width,:question
	has_many :snippets, embed_in_root: true
	has_many :positions
end