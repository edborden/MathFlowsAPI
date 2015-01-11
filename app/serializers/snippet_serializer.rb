class SnippetSerializer < ApplicationSerializer
	attributes :content,:image,:row, :col, :height, :width
	has_one :block
	
	def image
		if object.has_equation
			object.equation.image.data
		else
			nil
		end
	end

end
