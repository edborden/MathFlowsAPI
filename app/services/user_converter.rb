class UserConverter

	def initialize user,google
		@user = user
		@google = google
	end
	
	def from_guest
		@user.set_attrs_from_google @google
		UservoiceHandler.new(@user).handle :set_uservoice_token
		if invitation
			invitation.set_signup(@user) 
			@user.referred_by = invitation.referrer.name
		end
		@user.save
		MailchimpHandler.new.handle :subscribe, @user
		MailHandler.new.handle :welcome, @user
		KeenHandler.new.handle :publish,:signup, @user
		send_all_groupvitations
		return @user
	end

	def invitation
		@invitation ||= Invitation.find_by_referral_email @user.email
	end

	def send_all_groupvitations
		groupvitations = Groupvitation.where(receiver_email: @user.email)
		groupvitations.each do |groupvitation| 
			groupvitation.receiver_id = @user.id
			groupvitation.send_groupvitation_email
		end
	end

end