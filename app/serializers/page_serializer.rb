class PageSerializer < ApplicationSerializer
	has_many :blocks, embed_in_root: true
	has_one :document
	has_one :layout

	def blocks
		object.positionables
	end
end
