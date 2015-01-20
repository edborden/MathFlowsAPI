class LayoutSerializer < ApplicationSerializer
	attributes :cols, :row_height, :width,:height,:outside_margin,:inside_margin,:col_width,:block_cols,:block_row_height
end