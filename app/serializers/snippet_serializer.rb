class SnippetSerializer < ApplicationSerializer
	attributes :content
	has_one :block
		
end
