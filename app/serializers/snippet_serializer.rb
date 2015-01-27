class SnippetSerializer < PositionableSerializer
	attributes :content,:image,:question_number
	has_one :block
	
	##define for positionableserializer
	def position
		object.position
	end

	def image
		if object.has_equation
			object.equation.image.data
		elsif object.has_image
			object.image.data
		else
			nil
		end
	end

	def block
		object.position.owner
	end

end
