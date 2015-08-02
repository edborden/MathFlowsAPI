require 'uservoice-ruby'

class UservoiceHandler
	include Handler

	def initialize user
		@subdomain_name = 'mathflows'
		@api_key = 'Jpvk0JiwiGTm3sECPFd5A'
		@api_secret = '4bSZ9xGVigK58HSORzMqgsXdRcLe8HTsakEVSq7IY6Y'
		@sso_key = '5c727936a338efa1c54e702afb1d0b55'
		@user = user
	end

	def client
		@client ||= UserVoice::Client.new(@subdomain_name, @api_key, @api_secret)
	end

	def sso_token
		UserVoice.generate_sso_token(@subdomain_name, @sso_key, {
			guid: @user.id,
			display_name: @user.name,
			email: @user.email
		}, nil) 
	end

	def set_uservoice_token
		@user.uservoice_token = sso_token
	end

end