class SnippetPosition < Position

	def layout
		owner.positions.first.layout
	end

	#block_col_width
	def col_width position
		position.width / layout.block_cols
	end

	def row_height
		layout.block_row_height
	end

	def inside_margin
		0
	end

end
