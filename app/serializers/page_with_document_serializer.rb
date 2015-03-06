class PageWithDocumentSerializer < ApplicationSerializer
	has_one :document, embed_in_root: true
end
