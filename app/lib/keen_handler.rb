class KeenHandler

	def invitation invitation
		Keen.publish :invitation, {
			referrer_id: invitation.referrer_id,
			referral_email: invitation.referral_email
		}

	end

	def invitation_visit invitation
		Keen.publish :invitation_visit, {
			referrer_id: invitation.referrer_id,
			referral_email: invitation.referral_email,
			referral_id: invitation.referral_id
		}
	end

	def invitation_success invitation
		Keen.publish :invitation_signup, {
			referrer_id: invitation.referrer_id,
			referral_email: invitation.referral_email,
			referral_id: invitation.referral_id			
		}
	end

	def signup user
		Keen.publish :signup, {
			user_id: user.id
		}
	end
end