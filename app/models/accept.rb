class Accept
	attr_accessor :group

	def initialize user,groupvitation

		Unjoin.new(user) if user.group_id.present?
		Join.new user,groupvitation.group

		groupvitation.accepted!
		groupvitation.save
		KeenHandler.new.handle :publish,:groupvitation_accepted, groupvitation		

	end

end