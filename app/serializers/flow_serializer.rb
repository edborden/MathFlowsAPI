class FlowSerializer < ApplicationSerializer
	attributes :name,:open
	has_many :documents
	has_one :folder
end
