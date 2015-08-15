class Close

	def initialize user

		user.group.users.delete user if user.group
		user.blocks.each do |block| 
			if block.invalidations.count > 0
				block.destroy
			else
				block.page_id = nil
				block.user_id = nil
				block.save
			end
		end
		user.destroy

	end

end