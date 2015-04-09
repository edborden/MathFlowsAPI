class BlockSerializer < ApplicationSerializer
	attributes :question,:content,:row,:col,:row_span,:col_span,:height,:width,:x,:y
	has_one :image, embed_in_root:true
	has_one :user
	has_one :page
	has_one :test
end