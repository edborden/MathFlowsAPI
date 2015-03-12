module AddHeaders

	def AddHeaders::to_this page
		user = page.document.flow.folder.user
		user.headers.each do |header| 
			block = header.block.amoeba_dup
			block.save
			header = header.amoeba_dup
			header.user_id = nil
			header.block = block
			header.save
			page.positions<<header
		end
	end

end