class SnippetSerializer < PositionableSerializer
	attributes :content,:image,:width,:height,:x,:y
	has_one :block
	
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

	def x
		object.position.x
	end

	def y
		object.position.y
	end

end
