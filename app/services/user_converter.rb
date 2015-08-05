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
		KeenHandler.new.handle :publish,:signup, @user
		set_invitation
		send_all_groupvitations
		return @user
	end

	def set_invitation
		invitation = Invitation.find_by_referral_email @user.email
		invitation.set_signup if invitation	
	end

	def send_all_groupvitations
		groupvitations = Groupvitation.where(receiver_email: @user.email)
		groupvitations.each do |groupvitation| 
			groupvitation.receiver_id = @user.id
			groupvitation.send_groupvitation_email
		end
	end

end