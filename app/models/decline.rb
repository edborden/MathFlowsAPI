class Decline

	def initialize groupvitation

		groupvitation.declined = true
		groupvitation.save
		KeenHandler.new.handle :publish,:groupvitation_declined, groupvitation

	end

end