class UserConverter

	def initialize user,google
		@user = user
		@google = google
	end
	
	def from_guest
		@user.set_attrs_from_google @google
		UservoiceHandler.new(@user).handle :set_uservoice_token
		@user.save
		MailchimpHandler.new.handle :subscribe, @user
		MailHandler.new.handle :welcome, @user
		@user.invitation.try :set_signup
		KeenHandler.new.handle :signup, @user
		send_all_groupvitations
		return @user
	end

	def send_all_groupvitations
		groupvitations = Groupvitations.where(receiver_email: @user.email)
		groupvitations.each { |groupvitation| groupvitation.send_groupvitation_email }
	end

end