class Groupvitation < ActiveRecord::Base
	belongs_to :sender, class_name: "User"
	belongs_to :receiver, class_name: "User"
	has_one :group, through: :sender

	after_create :send_groupvitation_email, if: :receiver_is_a_user?
	after_create :create_matching_invitation, unless: :receiver_is_a_user?

	validates_presence_of :sender_id,:status,:receiver_email
	enum status: [:not_a_user,:sent,:accepted,:declined]

	def receiver_is_a_user?
		receiver_id.present?
	end

	def send_groupvitation_email
		MailHandler.new.handle :groupvitation, self
		KeenHandler.new.handle :publish,:groupvitation, self
		sent!
		save	
	end

	def create_matching_invitation
		Invitation.create referrer_id: sender.id,referral_email: receiver_email
	end

	def has_write_access? user
		[sender,receiver].include? user
	end

	def set_owner user
		self.sender_id = user.id
	end

end
