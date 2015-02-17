class User < ActiveRecord::Base
	has_one :session
	has_many :folders
	belongs_to :header, class_name: "Block"
	has_one :layout
	belongs_to :group

	has_many :invitations_sent, class_name: "Invitation", foreign_key: "referrer_id"
	has_many :referrals, through: :invitations_sent, source: :referral
	has_one :invitation, foreign_key: "referral_id"
	has_one :referrer, through: :invitation, source: :referrer

	def set_attrs_from_google google
		userinfo = google.userinfo
		self.name = userinfo.name
		self.email = userinfo.email
		self.gender = userinfo.gender
		self.pic = userinfo.picture
		self.google_id = userinfo.id
		self.google_link = userinfo.link
		self.google_refresh = google.authorization.refresh_token
		self.guest = false
		save
		return self
	end

end
