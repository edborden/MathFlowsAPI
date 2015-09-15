class CellSerializer < ApplicationSerializer
	attributes :content
	has_one :table
	has_one :row
	has_one :col
	has_many :lines, embed: :ids, include: :true
end
