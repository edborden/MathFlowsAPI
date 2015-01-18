class GuestHandler

	def setup
		user = User.create
		user.create_session
		flow = Flow.create_default
		user.flows<<flow
		return user
	end

end