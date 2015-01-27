class BlockSerializer < ApplicationSerializer
	attributes :question
	has_many :snippets,embed_in_root:true
	has_many :positions

	def snippets
		object.positionables
	end

end