module AddHeader

	def AddHeaders::to_this page
		user = page.document.flow.folder.user
		user.headers.each do |header| 
			header = header.amoeba_dup 
			header.save
			page.positions<<header
		end
	end

end