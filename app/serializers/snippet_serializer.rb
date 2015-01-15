class SnippetSerializer < PositionableSerializer
	attributes :content,:image
	has_one :block
	
	def image
		if object.has_equation
			object.equation.image.data
		else
			nil
		end
	end

	def block
		object.position.owner
	end

end
