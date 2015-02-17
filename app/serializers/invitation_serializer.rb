class InvitationSerializer < ApplicationSerializer
	attributes :referral_email
	has_one :referrer
	has_one :referral
end