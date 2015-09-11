class BlockWithoutLinesSerializer < ApplicationSerializer
	attributes :kind,:row,:col,:row_span,:col_span,:height,:width,:x,:y
	has_many :invalidations, embed: :ids, include: :true
end