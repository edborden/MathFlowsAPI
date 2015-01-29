class FlowSerializer < ApplicationSerializer
	attributes :name
	has_many :documents
	has_one :folder
end
