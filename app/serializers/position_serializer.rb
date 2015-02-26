class PositionSerializer < ApplicationSerializer
	attributes :row,:col,:row_span,:col_span,:height,:width,:y
	has_one :block,embed_in_root:true
	has_one :page
	has_one :user

end
