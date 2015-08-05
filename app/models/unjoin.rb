class Unjoin
	
	def initialize user
		@user = user
		@group = @user.group

		@group.users.delete @user
		@group.destroy unless @group.users.size > 1

		@user.groupvitations_sent.destroy_all

	end
	
end