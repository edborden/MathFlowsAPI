class PositionSerializer < PositionableSerializer
	attributes :width
	has_one :block,embed_in_root:true
	has_one :page

	##define for positionableserializer
	def position
		object
	end

	def block
		object.positionable
	end

	def page
		object.owner
	end

	def width
		object.width
	end
end
