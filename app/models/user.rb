class User < ActiveRecord::Base

	# ASSOCIATIONS

	enum gender: [:male,:female]

	has_one :session
	has_many :folders
	has_many :blocks
	has_many :tests
	belongs_to :group, counter_cache: true
	has_one :preference

	has_many :invitations_sent, class_name: "Invitation", foreign_key: "referrer_id"
	#has_many :referrals, through: :invitations_sent, source: :referral   #this won't always work bc referral_id won't always be set
	has_one :invitation, foreign_key: "referral_id"
	#has_one :referrer, through: :invitation, source: :referrer

	has_many :groupvitations_sent, class_name: "Groupvitation", foreign_key: "sender_id"
	#has_many :receivers, through: :groupvitations_sent, source: :receiver
	has_many :groupvitations, -> { where declined: false }, foreign_key: "receiver_id"
	#has_many :senders, through: :groupvitations, source: :sender

	# VALIDATIONS



	# CALLBACKS

	after_create :create_preference

	scope :not_guest, -> {where.not(guest:true)}


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
		return self
	end

	def headers
		blocks.where(header:true)
	end

end
