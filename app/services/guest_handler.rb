class GuestHandler

	def setup
		user = User.create
		user.create_session.issue_token
		grid = Grid.create
		user.grids<< grid
		return user
	end

end