require 'uservoice-ruby'

class UservoiceHandler
	include Handler

	def initialize user
		@subdomain_name = 'mathflows'
		@api_key = 'KsLaQgwhEO1aI4ubTF2ylg'
		@api_secret = 'vcTmPbPHHPtSGCKf6I2w4BIQwTQcvYAULDs13qq9Hs'
		@sso_key = 'c0b60e22e361162f5afacc4ba804477f'
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