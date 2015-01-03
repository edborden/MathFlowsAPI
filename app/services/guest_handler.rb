class GuestHandler

	def setup
		user = User.create
		user.create_session.issue_token
		layout = Layout.create
		user.layouts<< layout
		return user
	end

end