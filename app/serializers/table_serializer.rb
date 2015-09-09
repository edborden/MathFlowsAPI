class TableSerializer < ApplicationSerializer
	attributes :rows_count,:cols_count,:block_position
	has_many :projections, embed: :ids, include: :true
	has_many :cells, embed: :ids, include: :true #serialize from here instead of projections for less queries
	has_one :block
	has_one :alignment, embed: :ids, include: :true
end
