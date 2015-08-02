module Handler

	def handle command,*args
		if Rails.env == 'test'
			return
		else
			send command,*args
		end
	end

end