class Invitation < ActiveRecord::Base
	validates :referral_email, uniqueness: true
	validates :referral_email, presence: true

	belongs_to :referrer, class_name: "User"
	belongs_to :referral, class_name: "User"

	after_create :send_invitation_email

	def send_invitation_email
		MailHandler.new.handle :invitation, self
		KeenHandler.new.handle :publish,:invitation, self		
	end

	def set_signup referral
		self.referral_id = referral.id
		self.signed_up = true
		save
		KeenHandler.new.handle :publish,:invitation_signup, self
	end

	def set_owner user
		self.referrer_id = user.id
	end

end
