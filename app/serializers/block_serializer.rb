class BlockSerializer < BlockWithoutLinesSerializer
	has_one :image, embed: :ids, include: :true
	has_one :user
	has_one :page
	has_many :lines, embed: :ids, include: :true
end