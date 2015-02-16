class Invitation < ActiveRecord::Base
	belongs_to :referrer, class_name: "User"
	belongs_to :referral, class_name: "User"

	after_create :send_invitation_email

	def send_invitation_email
		Mailer.new.invitation referral_email,referrer
		KeenHandler.new.invitation self		
	end

end
