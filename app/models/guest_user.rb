class GuestUser
	attr_accessor :user

	def initialize
		@user = Waterfall.new.user(MasterMold.new.fresh_user)
	end

end