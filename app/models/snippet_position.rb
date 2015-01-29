class SnippetPosition < Position

	amoeba do
		enable
		customize ->(orig, copy) { copy.positionable = orig.positionable.amoeba_dup }
	end

	def layout
		owner.try(:positions).try(:first).try(:layout) || owner.try(:user).try(:layout)
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
