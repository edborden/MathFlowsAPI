class User < ActiveRecord::Base

	# ASSOCIATIONS

	enum gender: [:male,:female]

	has_one :session, dependent: :destroy
	has_many :folders, dependent: :destroy
	has_many :blocks, dependent: :nullify
	has_many :tests, dependent: :destroy
	belongs_to :group, counter_cache: true
	has_one :preference, dependent: :destroy
	has_one :plan, dependent: :destroy
	has_one :google, dependent: :destroy

	has_many :invitations_sent, class_name: "Invitation", foreign_key: "referrer_id", dependent: :destroy
	has_one :invitation, foreign_key: "referral_id", dependent: :nullify

	has_many :groupvitations_sent, class_name: "Groupvitation", foreign_key: "sender_id", dependent: :destroy
	has_many :groupvitations, -> { where.not(status:2) }, foreign_key: "receiver_id", dependent: :destroy

	# VALIDATIONS

	validates_uniqueness_of :email,allow_nil:true

	# CALLBACKS

	after_create :create_preference,:create_plan

	def headers
		blocks.header
	end

end
