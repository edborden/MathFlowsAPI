class PageSerializer < ApplicationSerializer
	has_one :document
	has_many :positions, embed_in_root: true
	has_one :layout, embed_in_root:true

end
