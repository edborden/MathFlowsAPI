class GuestHandler

	def setup
		user = User.create
		user.create_session
		folder = Folder.create
		user.folders<<folder
		return user
	end

end