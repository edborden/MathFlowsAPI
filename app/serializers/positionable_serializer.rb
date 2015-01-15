class PositionableSerializer < ApplicationSerializer
	attributes :row,:col,:row_span,:col_span
	
	def row
		object.position.row
	end

	def col
		object.position.col
	end

	def row_span
		object.position.row_span
	end

	def col_span
		object.position.col_span
	end

end
