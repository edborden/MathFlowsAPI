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

	def pdf_row
		self.row - 1
	end

	def pdf_col
		self.col - 1
	end

	def sized?
		has_width? || has_height?
	end

	def has_width?
		self.width > 1
	end

	def has_height?
		self.height > 1
	end

end
