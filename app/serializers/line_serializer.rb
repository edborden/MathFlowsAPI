class LineSerializer < ApplicationSerializer
	attributes :content,:position
	has_one :block
	has_one :cell
	has_many :styles, embed: :ids, include: :true

	def block
		object.lineable if object.lineable_type == "Block"
	end

	def cell
		object.lineable if object.lineable_type == "Cell"
	end		
end
