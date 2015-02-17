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
end