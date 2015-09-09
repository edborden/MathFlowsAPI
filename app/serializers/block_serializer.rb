class BlockSerializer < BlockWithoutLinesSerializer
	has_many :images, embed: :ids, include: :true
	has_one :user
	has_one :page
	has_many :lines, embed: :ids, include: :true
	has_many :tables, embed: :ids, include: :true
end