class UserConverter

	def initialize user,google
		@user = user
		@google = google
	end
	
	def from_guest
		@user.set_attrs_from_google @google
		UservoiceHandler.new(@user).set_uservoice_token
		@user.save
		MailchimpHandler.new.subscribe @user
		Mailer.new.welcome @user
		@user.invitation.try :set_signup
		KeenHandler.new.signup @user
		return @user
	end

end