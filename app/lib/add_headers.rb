module AddHeaders

	def AddHeaders::to_this page
		user = page.test.user
		user.headers.each do |block| 
			block = block.amoeba_dup
			block.page_id = page.id
			block.user_id = user.id
			block.header = false
			block.save
		end
	end

end