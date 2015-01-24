class FlowSerializer < ApplicationSerializer
	attributes :name
	has_one :layout, embed_in_root: true
	has_many :documents
	has_one :folder
end
