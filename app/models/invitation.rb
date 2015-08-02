class Invitation < ActiveRecord::Base
	belongs_to :referrer, class_name: "User"
	belongs_to :referral, class_name: "User"

	after_create :send_invitation_email

	def send_invitation_email
		MailHandler.new.handle :invitation, self
		KeenHandler.new.handle :invitation, self		
	end

	def set_signup
		self.signup = true
		save
		KeenHandler.new.handle :invitation_signup, self
	end

end
