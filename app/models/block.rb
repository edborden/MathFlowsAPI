class Block < ActiveRecord::Base
	has_one :position, as: :positionable
	has_many :child_positions, class_name: "Position", as: :owner, dependent: :destroy
	has_one :layout, as: :layoutable, class_name: "BlockLayout", dependent: :destroy
	has_many :positionables, through: :child_positions, source_type: "Snippet"

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
