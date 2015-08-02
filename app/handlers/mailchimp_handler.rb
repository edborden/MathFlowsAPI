class MailchimpHandler
	include Handler

	def client
		@client ||= Mailchimp::API.new "1bc69f45ba857110dbc2d35c00350611-us10"
	end

	def subscribe user
		begin
			client.lists.subscribe "22facc0315", {email:user.email}, {name:user.name}, 'html', false
		rescue Mailchimp::ListAlreadySubscribedError
			puts "rescued successfully"
		end
	end

end