class SnippetSerializer < ApplicationSerializer
	attributes :content,:equation
	has_one :block
		
end
