class BlockSerializer < ApplicationSerializer
	attributes :question,:row,:col,:row_span,:col_span,:height,:width,:x,:y
	has_one :image, embed: :ids, include: :true
	has_many :invalidations, embed: :ids, include: :true
	has_one :user
	has_one :page
	has_one :test
	has_many :lines, embed: :ids, include: :true
end