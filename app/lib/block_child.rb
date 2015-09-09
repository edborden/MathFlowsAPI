module BlockChild

	def set_block_position
		last_position = block.children.last.try :block_position
		if last_position
			block_position = last_position + 1
		else
			block_position = 0
		end
		self.block_position = block_position
	end

end