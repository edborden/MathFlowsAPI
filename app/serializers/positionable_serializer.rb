class PositionableSerializer < ApplicationSerializer
	attributes :row,:col,:row_span,:col_span,:height,:y
	
	def row
		position.row
	end

	def col
		position.col
	end

	def row_span
		position.row_span
	end

	def col_span
		position.col_span
	end

	def y
		position.y
	end

	def height
		position.height
	end

end
