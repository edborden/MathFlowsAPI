class Accept
	attr_accessor :group

	def initialize user,groupvitation

		@group = groupvitation.group

		Unjoin.new(user) if user.group_id.present?
		Join.new user,@group

		groupvitation.accepted = true
		groupvitation.save
		KeenHandler.new.handle :publish,:groupvitation_accepted, groupvitation		

	end

end