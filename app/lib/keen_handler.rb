class KeenHandler

	def invitation invitation
		Keen.publish :invitation, {
			referrer_id: invitation.referrer_id,
			referral_email: invitation.referral_email
		}

	end

end