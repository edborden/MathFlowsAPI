class BlockWithoutLinesSerializer < ApplicationSerializer
	attributes :question,:row,:col,:row_span,:col_span,:height,:width,:x,:y,:lines_height
	has_one :image
	has_many :invalidations, embed: :ids, include: :true
	has_one :user
	has_one :page
	has_one :test
	has_many :lines
end