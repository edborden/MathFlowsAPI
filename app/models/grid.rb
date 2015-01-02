class Grid < ActiveRecord::Base
	after_create :starting_block

	has_many :blocks

	def starting_block
		block = Block.new
		grid.blocks<< block
	end

end
