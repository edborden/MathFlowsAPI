class Invitation < ActiveRecord::Base
	validates_uniqueness_of :referral_email
	validates_presence_of :referral_email,:referrer_id

	belongs_to :referrer, class_name: "User"
	belongs_to :referral, class_name: "User"

	enum status: [:sent,:visited,:signed_up]

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
