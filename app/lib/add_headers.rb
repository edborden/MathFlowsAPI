module AddHeaders

	def AddHeaders::to_this page
		test = page.test
		user = test.folder.user
		user.blocks.each do |block| 
			block = block.amoeba_dup
			block.test_id = test.id
			block.page_id = page.id
			block.user_id = nil
			block.save
		end
	end

end