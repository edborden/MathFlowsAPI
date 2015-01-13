class GuestHandler

	def setup
		user = User.create
		user.create_session.issue_token
		flow = Flow.create_default
		user.flows<<flow
		return user
	end

end