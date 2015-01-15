class Block < ActiveRecord::Base
	has_one :position, as: :positionable
	has_many :child_positions, class_name: "Position", as: :owner
	has_one :layout, as: :layoutable, class_name: "BlockLayout"

	def self.create_default position
		block = Block.create
		layout = BlockLayout.default
		block.layout = layout
		block.position = position
		position = Position.create_default block
		block.child_positions<<position
		return block
	end

end
