require 'google/api_client'

class GoogleHandler

	def client
		@client ||= Google::APIClient.new(
			application_name: 'MathFlows',
			application_version: '1.0.0'
		)
	end

	def client_secrets
		@client_secrets ||= Google::APIClient::ClientSecrets.load
	end

	def authorization
		@authorization ||= client.authorization = client_secrets.to_authorization
	end

	def user_authorized code,redirect_uri="http://localhost:4200"
		authorization.code = code
		authorization.grant_type = "authorization_code"
		authorization.redirect_uri = redirect_uri
		authorization.fetch_access_token!
		return self
	end

	def exchange_refresh_token refresh_token
		authorization.grant_type = 'refresh_token'
		authorization.refresh_token = refresh_token
		authorization.fetch_access_token!
	end

	def oauth2
		@oauth2 ||= @client.discovered_api('oauth2')
	end

	def userinfo
		@userinfo ||= client.execute(
			api_method: oauth2.userinfo.get
			#parameters: {'cents' => 5}
		).data
	end

	def service_account
		email = "432493008033-aggpjpbrglr2noiqe7g1e8jrh112nic1@developer.gserviceaccount.com"
 		key = Google::APIClient::PKCS12.load_key("MathFlows-9d88d3afbc79.p12", "notasecret")
		asserter = Google::APIClient::JWTAsserter.new(
			email,
			"profile email",
			key
		)
		client.authorization = asserter.authorize
	end

end