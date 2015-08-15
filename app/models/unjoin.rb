class Unjoin
	
	def initialize user
		@user = user
		@group = @user.group

		@group.users.delete @user

		@user.groupvitations_sent.destroy_all

	end
	
end