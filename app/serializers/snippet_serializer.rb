class SnippetSerializer < ApplicationSerializer
	attributes :content,:image
	has_one :position
	
	def image
		if object.has_equation
			object.equation.image.data
		else
			nil
		end
	end

end
