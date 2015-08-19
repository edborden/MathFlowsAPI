class InvitationSerializer < ApplicationSerializer
	attributes :referral_email,:updated_at,:status
	has_one :referrer
	has_one :referral
end