class FlowSerializer < ApplicationSerializer
	has_one :layout, embed_in_root: true
	has_many :documents, embed_in_root: true
	has_one :user
end
