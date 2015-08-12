class BlockCopy
	attr_accessor :block

	def initialize copy_from_id,user

		copy_from = Block.find copy_from_id
		@block = copy_from.amoeba_dup
		@block.user_id = user.id
		@block.page_id = nil
		@block.col = nil
		@block.row = nil
		@block.save

	end

end