class BlockWithoutLinesSerializer < ApplicationSerializer
	attributes :question,:row,:col,:row_span,:col_span,:height,:width,:x,:y,:lines_height
	has_many :invalidations, embed: :ids, include: :true
end