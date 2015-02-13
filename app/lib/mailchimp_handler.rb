class MailchimpHandler

	def client
		@client ||= Mailchimp::API.new "1bc69f45ba857110dbc2d35c00350611-us10"
	end

	def subscribe user
		if Rails.env == 'production'
			client.lists.subscribe "22facc0315", {email:user.email}, {name:user.name}, 'html', false
		end
	end

end